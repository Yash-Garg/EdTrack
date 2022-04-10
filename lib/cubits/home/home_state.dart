part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool loading,
    required bool hasError,
    User? user,
    Attendance? attendance,
  }) = _HomeState;

  factory HomeState.initial() => _HomeState(
        loading: true,
        hasError: false,
        user: null,
        attendance: null,
      );

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
