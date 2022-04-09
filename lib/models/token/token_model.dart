import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/models/token/token_model.freezed.dart';

@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({
    required String accessToken,
    required String tokenType,
    required int expiresIn,
    required String xContextId,
    required String xUserId,
    required String xLogoId,
    required String xRx,
    required String pChangeSetting,
    required String pChangeStatus,
    required String issued,
    required String expires,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
