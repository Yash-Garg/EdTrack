import '../../models/user/user_attendance.dart';
import 'package:flutter/material.dart';

class SubjectAttendance extends StatefulWidget {
  final List<Lecture> mainLectures, extraLectures;
  final int subjectId;

  const SubjectAttendance({
    Key? key,
    required this.mainLectures,
    required this.extraLectures,
    required this.subjectId,
  }) : super(key: key);

  @override
  State<SubjectAttendance> createState() => _SubjectAttendanceState();
}

class _SubjectAttendanceState extends State<SubjectAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subjectId.toString()),
      ),
    );
  }
}
