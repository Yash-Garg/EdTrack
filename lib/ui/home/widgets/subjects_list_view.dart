import 'package:flutter/material.dart';

import '../../../models/user/user_attendance.dart';
import '../../../theme_data.dart';

class SubjectsListView extends StatelessWidget {
  final List<Subject> subjects;
  const SubjectsListView({
    Key? key,
    required this.subjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: subjects.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final subject = subjects[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Card(
            elevation: .0,
            color: AppTheme.mildBlack.withOpacity(.05),
            shape: AppTheme.cardShape,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                horizontalTitleGap: 20,
                // leading: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //     Icon(Icons.shield_outlined),
                //   ],
                // ),
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
        );
      },
    );
  }
}
