import 'package:flutter/material.dart';

import '../../../data/models/user/user_attendance.dart';
import '../../../data/models/user/user_batch.dart';
import '../../common/custom_card_tile.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({
    super.key,
    required this.attendanceDetails,
    required this.batch,
  });

  final StdSubAtdDetails attendanceDetails;
  final UserBatch batch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          CustomCardTile(
            title: 'Course',
            subtitle: '${batch.courseName} (${batch.semester} SEM)',
            icon: Icons.account_balance_rounded,
            bgColor: Color.fromARGB(255, 253, 203, 203),
            iconColor: Colors.red,
          ),
          SizedBox(width: 10),
          CustomCardTile(
            title: 'Overall Present',
            subtitle: '${attendanceDetails.overallPresent.toInt()} Lectures',
            icon: Icons.done_all,
            bgColor: Color.fromARGB(255, 167, 248, 209),
            iconColor: Colors.green,
          ),
          SizedBox(width: 10),
          CustomCardTile(
            title: 'Total Lectures',
            subtitle: '${attendanceDetails.overallLecture.toInt()} Lectures',
            icon: Icons.date_range,
            bgColor: Color.fromARGB(255, 209, 195, 255),
            iconColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
