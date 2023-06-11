import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/models/token/token_model.freezed.dart';
part '../../../generated/data/models/token/token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'expires_in') required int expiresIn,
    @JsonKey(name: 'X-ContextId') required String contextId,
    @JsonKey(name: 'X-UserId') required String userId,
    @JsonKey(name: 'X-LogoId') required String logoId,
    @JsonKey(name: 'X-RX') required String rx,
    @JsonKey(name: 'PChangeSetting') required String changeSetting,
    @JsonKey(name: 'PChangeStatus') required String changeStatus,
    @JsonKey(name: '.issued') required String issued,
    @JsonKey(name: '.expires') required String expires,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
