import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/models/error/api_error.freezed.dart';
part '../../../generated/data/models/error/api_error.g.dart';

@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    @JsonKey(name: 'error_code') int? errorCode,
    @JsonKey(name: 'error_message')
    @JsonKey(defaultValue: 'Something went wrong.')
    @Default('Something went wrong.')
    String? message,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
