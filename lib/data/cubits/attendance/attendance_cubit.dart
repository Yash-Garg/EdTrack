import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../data/models/user/user_attendance.dart';
import '../../../utils/enums.dart';

part '../../../generated/data/cubits/attendance/attendance_cubit.freezed.dart';
part 'attendance_state.dart';

@lazySingleton
class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceState.initial());

  late List<Lecture> _extraLectures;
  late List<Lecture> _mainLectures;
  late int _subId;

  started({
    required List<Lecture> extraLectures,
    required List<Lecture> mainLectures,
    required int subjectId,
    required int batchId,
  }) async {
    _extraLectures = extraLectures;
    _mainLectures = mainLectures;
    _subId = subjectId;
    _calculate();
  }

  changeDate(DateTime date) {
    List<AttendanceType> events = [];
    final formatter = DateFormat('yyyy-MM-dd');

    for (final lecture in state.lectures!) {
      if (formatter.format(lecture.absentDate) == (formatter.format(date))) {
        events.add(
          lecture.isAbsent ? AttendanceType.Absent : AttendanceType.Present,
        );
      }
    }
    debugPrint('Attendance Events - $events');

    emit(state.copyWith(
      loading: false,
      classEvents: events,
      selectedDate: date,
    ));
  }

  _calculate() {
    List<Lecture> lectures = [];
    List<DateTime> lectureDates = [];

    lectures
      ..addAll(
        _mainLectures.where((sub) => sub.subjectId == _subId),
      )
      ..addAll(
        _extraLectures.where((sub) => sub.subjectId == _subId),
      )
      ..sort((a, b) => a.absentDate.compareTo(b.absentDate));

    for (final sub in lectures) {
      lectureDates.add(sub.absentDate);
    }

    emit(state.copyWith(eventDates: lectureDates, lectures: lectures));
    changeDate(lectureDates.last);
  }
}
