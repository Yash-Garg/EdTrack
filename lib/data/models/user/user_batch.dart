import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/models/user/user_batch.freezed.dart';
part '../../../generated/data/models/user/user_batch.g.dart';

@freezed
class UserBatch with _$UserBatch {
  const factory UserBatch({
    required int userId,
    required int batchId,
    required int courseId,
    required String batchName,
    required String courseName,
    required bool isDeleted,
    required bool isBatchPlacement,
    required int semester,
    required bool userStatus,
  }) = _UserBatch;

  factory UserBatch.fromJson(Map<String, dynamic> json) =>
      _$UserBatchFromJson(json);
}
