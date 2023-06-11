import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/cubits/attendance/attendance_cubit.dart';
import '../../theme_data.dart';
import '../../../utils/enums.dart';
import '../../common/custom_card_tile.dart';
import '../../common/custom_snackbar.dart';
import '../subject_details.dart';

class SubjectInfoCard extends StatelessWidget {
  const SubjectInfoCard({
    super.key,
    required this.attendance,
    required this.state,
  });

  final SubjectAttendance attendance;
  final AttendanceState state;

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('MMMM dd, yyyy').format(state.selectedDate);

    final present =
        state.classEvents?.where((e) => e == AttendanceType.Present).toList() ??
            [];
    final absent =
        state.classEvents?.where((e) => e == AttendanceType.Absent).toList() ??
            [];

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        shape: AppTheme.cardShape,
        elevation: 0,
        color: AppTheme.mildBlack.withOpacity(.03),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ListTile(
                contentPadding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, .0),
                title: Text(
                  attendance.subject.name,
                  style: AppTheme.bodyMedium.copyWith(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Subject ID (${attendance.subject.id})',
                  style: AppTheme.bodySmall.copyWith(
                    fontSize: 14,
                    color: AppTheme.mildBlack,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () => showCustomSnack(
                    context: context,
                    bgColor: AppTheme.mildBlack,
                    message: 'Tap on the month to change dates.',
                  ),
                  icon: Icon(
                    Icons.info_outline_rounded,
                    size: 30,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView(
                padding: EdgeInsets.only(bottom: 20.0),
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
      ),
    );
  }
}
