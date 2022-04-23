import 'package:flutter/material.dart';

import '../../../cubits/home/home_cubit.dart';
import '../../../injectable.dart';
import '../../../theme_data.dart';
import '../subject_details.dart';

class SubjectInfoCard extends StatelessWidget {
  const SubjectInfoCard({
    Key? key,
    required this.attendance,
  }) : super(key: key);

  final SubjectAttendance attendance;

  @override
  Widget build(BuildContext context) {
    final subCode = getIt<HomeCubit>()
        .state
        .subDetails!
        .firstWhere((s) => s.id == attendance.subject.id)
        .code;

    return Card(
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
              attendance.subject.name,
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
    );
  }
}
