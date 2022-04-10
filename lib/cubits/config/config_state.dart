part of 'config_cubit.dart';

@freezed
class ConfigState with _$ConfigState {
  const factory ConfigState({
    required bool isLoggedIn,
    @JsonKey(ignore: true) CredentialObject? credentials,
  }) = _ConfigState;

  factory ConfigState.initial() => _ConfigState(
        isLoggedIn: false,
        credentials: null,
      );

  factory ConfigState.fromJson(Map<String, dynamic> json) =>
      _$ConfigStateFromJson(json);
}
