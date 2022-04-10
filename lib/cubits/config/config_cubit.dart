import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../api/login_api.dart';
import '../../injectable.dart';
import '../../models/credential/credential_object.dart';
import '../../ui/home/home_page.dart';
import '../../utils/box.dart';

part '../../generated/cubits/config/config_cubit.freezed.dart';
part '../../generated/cubits/config/config_cubit.g.dart';
part 'config_state.dart';

@lazySingleton
class ConfigCubit extends HydratedCubit<ConfigState> {
  ConfigCubit() : super(ConfigState.initial());

  started() async {
    final credentials = await BoxUtils.getCredentialBox();
    emit(state.copyWith(credentials: credentials));
  }

  setCredentials({
    required BuildContext context,
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

          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (_) => HomePage()),
          );
        }
      },
      (err) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(err.message!)),
        );
      },
    );
  }

  reset() {
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
