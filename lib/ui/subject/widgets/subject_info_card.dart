import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../cubits/attendance/attendance_cubit.dart';
import '../../../cubits/home/home_cubit.dart';
import '../../../injectable.dart';
import '../../../theme_data.dart';
import '../../../utils/enums.dart';
import '../../common/custom_card_tile.dart';
import '../subject_details.dart';

class SubjectInfoCard extends StatelessWidget {
  const SubjectInfoCard({
    Key? key,
    required this.attendance,
    required this.state,
  }) : super(key: key);

  final SubjectAttendance attendance;
  final AttendanceState state;

  @override
  Widget build(BuildContext context) {
    final subCode = getIt<HomeCubit>()
        .state
        .subDetails
        ?.firstWhere((s) => s.id == attendance.subject.id)
        .code;

    final date = DateFormat('MMMM dd, yyyy').format(state.selectedDate);

    final present =
        state.classEvents?.where((e) => e == AttendanceType.Present).toList() ??
            [];
    final absent =
        state.classEvents?.where((e) => e == AttendanceType.Absent).toList() ??
            [];

    return Card(
      shape: AppTheme.cardShape,
      elevation: 0,
      color: AppTheme.mildBlack.withOpacity(.03),
      child: ListView(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, .0),
            title: Text(
              attendance.subject.name,
              style: AppTheme.bodyMedium.copyWith(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            subtitle: subCode != null
                ? Text(
                    'Subject Code ($subCode)',
                    style: AppTheme.bodySmall.copyWith(
                      fontSize: 16,
                      color: AppTheme.mildBlack,
                    ),
                  )
                : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                CustomCardTile(
                  title: 'Status on $date',
                  subtitle: (state.classEvents ?? []).isEmpty
                      ? 'No lectures on this day.'
                      : 'Absent in ${absent.length} ${absent.length == 1 ? 'lecture' : 'lectures'} & Present in ${present.length} ${present.length == 1 ? 'lecture' : 'lectures'}.',
                  icon: Icons.star_outline_sharp,
                  bgColor: Color.fromARGB(255, 176, 176, 249),
                  iconColor: Colors.purple,
                ),
                const SizedBox(height: 5.0),
                CustomCardTile(
                  title: 'Total Present',
                  subtitle:
                      '${attendance.subject.presentLectures.toInt()} Lectures',
                  icon: Icons.check_circle_outline_rounded,
                  bgColor: Color.fromARGB(255, 176, 217, 249),
                  iconColor: Colors.blue,
                ),
                const SizedBox(height: 5.0),
                CustomCardTile(
                  title: 'Total Absent',
                  subtitle:
                      '${attendance.subject.absentLectures.toInt()} Lectures',
                  icon: Icons.close_sharp,
                  bgColor: Color.fromARGB(255, 255, 195, 195),
                  iconColor: Colors.red,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
