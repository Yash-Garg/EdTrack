part of 'config_cubit.dart';

@freezed
class ConfigState with _$ConfigState {
  const factory ConfigState({
    required bool isLoggedIn,
  }) = _ConfigState;

  factory ConfigState.initial() => _ConfigState(isLoggedIn: false);
}
