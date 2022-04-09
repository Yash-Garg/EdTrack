import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../models/error/api_error.dart';
import '../models/token/token_model.dart';
import 'endpoints.dart';

@lazySingleton
class LoginApi {
  final Dio dio;

  LoginApi({
    required this.dio,
  });

  Future<Either<TokenModel, ApiError>> getAccessToken({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        Endpoints.tokenEndpoint,
        data: {
          'grant_type': 'password',
          'username': username,
          'password': password,
          'remember': true.toString(),
        },
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );

      final tokenData = TokenModel.fromJson(response.data);

      debugPrint('ACCESS TOKEN - ${tokenData.accessToken}');
      return left(tokenData);
    } catch (e, trace) {
      debugPrint('ERROR - $e\nTRACE - $trace');
      return right(ApiError(message: 'Failed to login'));
    }
  }
}
