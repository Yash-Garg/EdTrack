import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../models/error/api_error.dart';
import '../models/user/user_model.dart';
import 'endpoints.dart';

@lazySingleton
class DataApi {
  final Dio dio;

  DataApi(this.dio);

  Future<Either<User, ApiError>> getUserDetails({
    required String userId,
    required String authToken,
  }) async {
    try {
      final response = await dio.get(
        '${Endpoints.userDetails}/$userId?y=0',
        options: Options(
          responseType: ResponseType.json,
          headers: {'authorization': 'Bearer $authToken'},
        ),
      );

      final user = User.fromJson(response.data);

      debugPrint('USER - ${user.firstName}');
      return left(user);
    } catch (e, trace) {
      debugPrint('ERROR - $e\nTRACE - $trace');
      return right(ApiError(message: 'Failed to fetch details'));
    }
  }
}
