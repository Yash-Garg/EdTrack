part of 'attendance_cubit.dart';

@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState({
    required bool loading,
    required DateTime selectedDate,
    List<Lecture>? lectures,
    List<DateTime>? eventDates,
    List<AttendanceType>? classEvents,
  }) = _AttendanceState;

  factory AttendanceState.initial() => _AttendanceState(
        loading: true,
        classEvents: null,
        eventDates: null,
        lectures: null,
        selectedDate: DateTime.now(),
      );
}
