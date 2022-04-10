import 'package:flutter/material.dart';

import '../../../models/user/user_attendance.dart';
import '../../../theme_data.dart';

class AttendanceCard extends StatelessWidget {
  final Attendance attendance;
  const AttendanceCard({
    Key? key,
    required this.attendance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: AppTheme.cardShape,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 170,
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
              Text(
                'Your Attendance',
                style: AppTheme.titleMedium,
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
      ),
    );
  }
}
