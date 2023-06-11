import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/models/subject/subject_info_model.freezed.dart';
part '../../../generated/data/models/subject/subject_info_model.g.dart';

@freezed
class SubjectDetails with _$SubjectDetails {
  const factory SubjectDetails({
    required int subjectGroupId,
    required int id,
    required String name,
    required String code,
  }) = _SubjectDetails;

  factory SubjectDetails.fromJson(Map<String, dynamic> json) =>
      _$SubjectDetailsFromJson(json);
}
