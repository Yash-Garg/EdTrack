import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/api/login_api.dart';
import '../../../injectable.dart';
import '../../../data/models/credential/credential_object.dart';
import '../../../ui/common/custom_snackbar.dart';
import '../../../ui/home/home_page.dart';
import '../../../utils/box.dart';

part '../../../generated/data/cubits/config/config_cubit.freezed.dart';
part '../../../generated/data/cubits/config/config_cubit.g.dart';
part 'config_state.dart';

@lazySingleton
class ConfigCubit extends HydratedCubit<ConfigState> {
  ConfigCubit() : super(ConfigState.initial());

  started() async {
    debugPrint('CONFIG CUBIT STARTED');
    final credentials = await BoxUtils.getCredentialBox();
    emit(state.copyWith(credentials: credentials));
  }

  setCredentials({
    required NavigatorState navigator,
    required String username,
    required String password,
  }) async {
    final tokenResponse = await getIt<LoginApi>().getAccessToken(
      username: username,
      password: password,
    );

    tokenResponse.fold(
      (model) async {
        final isAccountSet = await BoxUtils.setAccount(tokenModel: model);
        if (isAccountSet) {
          emit(state.copyWith(
            isLoggedIn: true,
            credentials: CredentialObject()
              ..accessToken = model.accessToken
              ..expires = model.expires
              ..issued = model.issued
              ..userId = int.parse(model.userId)
              ..tokenType = model.tokenType
              ..rx = model.rx
              ..contextId = model.contextId,
          ));

          navigator.pushReplacement(HomePage.route());
        }
      },
      (err) {
        showCustomSnack(context: navigator.context, message: err.message);
      },
    );
  }

  reset() {
    debugPrint('CONFIG CUBIT RESET');
    emit(ConfigState.initial());
  }

  @override
  ConfigState? fromJson(Map<String, dynamic> json) {
    try {
      return ConfigState.fromJson(json);
    } catch (e) {
      return ConfigState.initial();
    }
  }

  @override
  Map<String, dynamic>? toJson(ConfigState state) {
    return state.toJson();
  }
}
