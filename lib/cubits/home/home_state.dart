part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool loading,
    User? user,
  }) = _HomeState;

  factory HomeState.initial() => _HomeState(
        loading: true,
        user: null,
      );

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
