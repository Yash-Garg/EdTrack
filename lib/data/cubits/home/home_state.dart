part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool loading,
    required bool hasError,
    User? user,
    Attendance? attendance,
    UserBatch? userBatch,
    List<SubjectDetails>? subDetails,
  }) = _HomeState;

  factory HomeState.initial() => _HomeState(
        loading: true,
        hasError: false,
        user: null,
        attendance: null,
        userBatch: null,
        subDetails: null,
      );
}
