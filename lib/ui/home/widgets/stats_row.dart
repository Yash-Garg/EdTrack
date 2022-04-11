import 'package:flutter/material.dart';

import '../../../models/user/user_attendance.dart';
import '../../common/custom_card_tile.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({
    Key? key,
    required this.attendanceDetails,
  }) : super(key: key);

  final StdSubAtdDetails attendanceDetails;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCardTile(
            title: 'Overall Present',
            subtitle: '${attendanceDetails.overallPresent.toInt()} Lectures',
            icon: Icons.done_all,
            bgColor: Color.fromARGB(255, 167, 248, 209),
            iconColor: Colors.green,
          ),
          // SizedBox(width: 10),
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
