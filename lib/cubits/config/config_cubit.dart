import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../utils/box.dart';

part '../../generated/cubits/config/config_cubit.freezed.dart';
part 'config_state.dart';

@lazySingleton
class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit() : super(ConfigState.initial());

  started() {
    _checkLogin();
  }

  _checkLogin() async {
    final loginStatus = await BoxUtils.checkLogin();
    emit(state.copyWith(isLoggedIn: loginStatus));
  }

  reset() {
    emit(ConfigState.initial());
  }
}
