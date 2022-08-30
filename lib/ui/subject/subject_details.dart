import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/attendance/attendance_cubit.dart';
import '../../injectable.dart';
import '../../models/user/user_attendance.dart';
import '../../theme_data.dart';
import 'widgets/subject_info_card.dart';

class SubjectAttendance extends StatefulWidget {
  final List<Lecture> mainLectures, extraLectures;
  final Subject subject;

  const SubjectAttendance({
    super.key,
    required this.mainLectures,
    required this.extraLectures,
    required this.subject,
  });

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
        subjectId: widget.subject.id,
        batchId: widget.subject.batchId,
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      bloc: _attendanceCubit,
      builder: (context, state) {
        if (state.loading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppTheme.accentBlue),
            ),
          );
        }

        if (!state.loading) {
          return Scaffold(
            appBar: CalendarAppBar(
              firstDate: state.eventDates?.first ?? DateTime.now(),
              lastDate: state.eventDates?.last ?? DateTime.now(),
              events: state.eventDates,
              backButton: true,
              accent: AppTheme.accentBlue,
              onDateChanged: (date) => state.eventDates == null
                  ? null
                  : _attendanceCubit.changeDate(date),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SubjectInfoCard(attendance: widget, state: state),
            ),
          );
        }
        return Center(
          child: Text(
            'No Data Found',
            style: AppTheme.titleMedium.copyWith(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        );
      },
    );
  }
}
