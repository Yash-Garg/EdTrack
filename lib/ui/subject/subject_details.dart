import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubits/attendance/attendance_cubit.dart';
import '../../injectable.dart';
import '../../models/user/user_attendance.dart';
import '../../theme_data.dart';
import '../../utils/enums.dart';

class SubjectAttendance extends StatefulWidget {
  final List<Lecture> mainLectures, extraLectures;
  final int subjectId;
  final String subjectName;

  const SubjectAttendance({
    Key? key,
    required this.mainLectures,
    required this.extraLectures,
    required this.subjectId,
    required this.subjectName,
  }) : super(key: key);

  @override
  State<SubjectAttendance> createState() => _SubjectAttendanceState();
}

class _SubjectAttendanceState extends State<SubjectAttendance> {
  late AttendanceCubit _attendanceCubit;

  @override
  void initState() {
    _attendanceCubit = getIt<AttendanceCubit>()
      ..started(
        mainLectures: widget.mainLectures,
        extraLectures: widget.extraLectures,
        subjectId: widget.subjectId,
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      bloc: _attendanceCubit,
      builder: (context, state) {
        if (!state.loading) {
          final present = state.classEvents
              ?.where((e) => e == AttendanceType.Present)
              .toList();
          final absent = state.classEvents
              ?.where((e) => e == AttendanceType.Absent)
              .toList();

          return Scaffold(
            appBar: CalendarAppBar(
              firstDate: state.eventDates!.first,
              lastDate: state.eventDates!.last,
              events: state.eventDates,
              accent: AppTheme.accentBlue,
              onDateChanged: (DateTime date) =>
                  _attendanceCubit.changeDate(date),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'You have ${absent!.length} absent & ${present!.length} present entries on ${DateFormat('MMMM d, yyyy').format(state.selectedDate)}.',
                  textAlign: TextAlign.center,
                  style: AppTheme.bodyMedium.copyWith(fontSize: 20),
                ),
              ),
            ),
          );
        }
        return Center(
          child: Text('No Data Found'),
        );
      },
    );
  }
}
