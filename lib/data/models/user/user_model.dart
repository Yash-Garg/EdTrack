import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/models/user/user_model.freezed.dart';
part '../../../generated/data/models/user/user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int userId,
    required int batchId,
    required String loginName,
    required String firstName,
    required String lastName,
    required String admissionNumber,
    required String rollNumber,
    required String email,
    required DateTime admissionDate,
    required DateTime dob,
    required int profilePictureId,
    required String aadhaarNumber,
    required String smsMobileNumber,
    required String gender,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
