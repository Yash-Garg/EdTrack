import 'package:flutter/material.dart';

import '../../../data/models/user/user_attendance.dart';
import '../../theme_data.dart';
import '../../common/custom_shadow_card.dart';

class AttendanceCard extends StatelessWidget {
  final Attendance attendance;
  const AttendanceCard({
    super.key,
    required this.attendance,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShadowCard(
      height: 170,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 153, 255),
              AppTheme.accentBlue,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Attendance',
                  style: AppTheme.titleMedium,
                ),
                Text(
                  attendance.stdSubAtdDetails.subjects != null
                      ? '${attendance.stdSubAtdDetails.subjects!.length} Subjects (incl. Labs)'
                      : 'Not uploaded yet',
                  style: AppTheme.titleMedium.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '${attendance.stdSubAtdDetails.overallPercentage.toStringAsFixed(1)}%',
                style: AppTheme.titleMedium.copyWith(
                  fontSize: 30,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
