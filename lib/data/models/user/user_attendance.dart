import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/models/user/user_attendance.freezed.dart';
part '../../../generated/data/models/user/user_attendance.g.dart';

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    required StdSubAtdDetails stdSubAtdDetails,
    required List<Lecture> attendanceData,
    required List<Lecture> extraLectures,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
}

@freezed
class StdSubAtdDetails with _$StdSubAtdDetails {
  const factory StdSubAtdDetails({
    required List<Subject>? subjects,
    required double overallPercentage,
    required double overallPresent,
    required double overallLecture,
  }) = _StdSubAtdDetails;

  factory StdSubAtdDetails.fromJson(Map<String, dynamic> json) =>
      _$StdSubAtdDetailsFromJson(json);
}

@freezed
class Subject with _$Subject {
  const factory Subject({
    required int groupId,
    required int batchId,
    required int subjectGroupType,
    required int id,
    required int subjectGroupId,
    required int subSubjectId,
    required String name,
    required bool isAdditionalSubject,
    required bool isTimeTableSubject,
    @JsonKey(name: 'totalExtraLeactureForSubject')
    required int totalExtraLectureForSubject,
    @JsonKey(name: 'presentInExtraLeactureForSubject')
    required int presentInExtraLectureForSubject,
    @JsonKey(name: 'absentInExtraLeactureForSubject')
    required int absentInExtraLectureForSubject,
    @JsonKey(name: 'totalLeactures') required int totalLectures,
    @JsonKey(name: 'presentLeactures') required int presentLectures,
    required int otherAttendance,
    @JsonKey(name: 'absentLeactures') required int absentLectures,
    required int averagePresent,
    required int averageTotal,
    required double percentageAttendance,
    required int actualSubjectId,
    required bool isSubjectSeleted,
    required int sequence,
    required int subjectMappingId,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@freezed
class Lecture with _$Lecture {
  const factory Lecture({
    required int? attendeeUserId,
    required DateTime absentDate,
    required bool isAbsent,
    required int subjectId,
  }) = _Lecture;

  factory Lecture.fromJson(Map<String, dynamic> json) =>
      _$LectureFromJson(json);
}
