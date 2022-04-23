import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/attendance/attendance_cubit.dart';
import '../../cubits/home/home_cubit.dart';
import '../../injectable.dart';
import '../../models/user/user_attendance.dart';
import '../../theme_data.dart';
import '../../utils/enums.dart';

class SubjectAttendance extends StatefulWidget {
  final List<Lecture> mainLectures, extraLectures;
  final Subject subject;

  const SubjectAttendance({
    Key? key,
    required this.mainLectures,
    required this.extraLectures,
    required this.subject,
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
          final subCode = getIt<HomeCubit>()
              .state
              .subDetails!
              .firstWhere((s) => s.id == widget.subject.id)
              .code;

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
              backButton: true,
              accent: AppTheme.accentBlue,
              onDateChanged: (DateTime date) =>
                  _attendanceCubit.changeDate(date),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Card(
                shape: AppTheme.cardShape,
                elevation: 0,
                color: AppTheme.mildBlack.withOpacity(.03),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      title: Text(
                        widget.subject.name,
                        style: AppTheme.bodyMedium.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        'Subject Code ($subCode)',
                        style: AppTheme.bodySmall.copyWith(
                          fontSize: 16,
                          color: AppTheme.mildBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Card(
              //   color: AppTheme.mildBlack.withOpacity(.05),
              //   shape: AppTheme.cardShape,
              //   elevation: .0,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ListTile(
              //       title: Text(
              //         widget.subject.name +
              //             widget.subject.percentageAttendance
              //                 .toStringAsFixed(1),
              //       ),
              //     ),
              //   ),
              // ),
              //   Text(
              //     'You have ${absent!.length} absent & ${present!.length} present entries on ${DateFormat('MMMM d, yyyy').format(state.selectedDate)}.',
              //     style: AppTheme.bodyMedium.copyWith(fontSize: 20),
              //   ),
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
