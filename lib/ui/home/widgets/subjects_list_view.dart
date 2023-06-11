import 'package:edtrack/ui/common/custom_snackbar.dart';
import 'package:flutter/material.dart';

import '../../../data/models/user/user_attendance.dart';
import '../../theme_data.dart';
import '../../subject/subject_details.dart';

class SubjectsListView extends StatelessWidget {
  final Attendance attendance;

  const SubjectsListView({
    super.key,
    required this.attendance,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: attendance.stdSubAtdDetails.subjects!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final subject = attendance.stdSubAtdDetails.subjects![index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Card(
            elevation: .0,
            color: AppTheme.mildBlack.withOpacity(.05),
            shape: AppTheme.cardShape,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppTheme.cardRadius),
              onTap: () => subject.totalLectures > 0
                  ? Navigator.push(
                      context,
                      SubjectAttendance.route(
                        mainLectures: attendance.attendanceData,
                        extraLectures: attendance.extraLectures,
                        subject: subject,
                      ),
                    )
                  : showCustomSnack(
                      context: context,
                      message: 'No lectures to show for this subject yet',
                    ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: AppTheme.cardShape,
                  horizontalTitleGap: 20,
                  title: Text(
                    subject.name,
                    style: AppTheme.bodyMedium.copyWith(fontSize: 16),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'Attendance - ${subject.presentLectures} / ${subject.totalLectures}',
                      style: AppTheme.bodyMedium.copyWith(
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: (subject.percentageAttendance / 100),
                        backgroundColor: AppTheme.mildBlack.withOpacity(.1),
                        valueColor: AlwaysStoppedAnimation(
                          AppTheme.getColor(subject.percentageAttendance),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
