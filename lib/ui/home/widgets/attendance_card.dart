import 'package:flutter/material.dart';

import '../../../models/user/user_attendance.dart';
import '../../../theme_data.dart';
import '../../common/custom_shadow_card.dart';

class AttendanceCard extends StatelessWidget {
  final Attendance attendance;
  const AttendanceCard({
    Key? key,
    required this.attendance,
  }) : super(key: key);

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
                  '${attendance.stdSubAtdDetails.subjects.length} Subjects (incl. Labs)',
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
                attendance.stdSubAtdDetails.overallPercentage
                        .toStringAsFixed(2) +
                    '%',
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