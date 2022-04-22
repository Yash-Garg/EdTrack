import 'package:flutter/material.dart';

import '../../models/user/user_attendance.dart';

class SubjectAttendance extends StatefulWidget {
  final List<Lecture> mainLectures, extraLectures;
  final int subjectId;
  final String subjectName;

  const SubjectAttendance({
    Key? key,
    required this.mainLectures,
    required this.extraLectures,
    required this.subjectId,
    required this.subjectName,
  }) : super(key: key);

  @override
  State<SubjectAttendance> createState() => _SubjectAttendanceState();
}

class _SubjectAttendanceState extends State<SubjectAttendance> {
  List<Lecture> subjectLectures = [];

  @override
  void initState() {
    debugPrint(widget.subjectId.toString());
    subjectLectures
      ..addAll(
        widget.mainLectures.where((sub) => sub.subjectId == widget.subjectId),
      )
      ..addAll(
        widget.extraLectures.where((sub) => sub.subjectId == widget.subjectId),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subjectName),
      ),
      body: ListView.builder(
        itemCount: subjectLectures.length,
        itemBuilder: (_, index) {
          final lecture = subjectLectures[index];
          return ListTile(
            title: Text(
              '${index + 1}. ' + lecture.absentDate.toLocal().toString(),
            ),
            subtitle: Text(lecture.isAbsent ? 'A' : 'P'),
          );
        },
      ),
    );
  }
}
