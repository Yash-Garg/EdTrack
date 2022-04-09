part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoggedIn,
  }) = _LoginState;

  factory LoginState.initial() => _LoginState(isLoggedIn: false);
}
