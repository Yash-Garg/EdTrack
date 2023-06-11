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
        Endpoints.token,
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

      debugPrint('Access token issued at ${tokenData.issued}');
      return left(tokenData);
    } catch (e, trace) {
      debugPrint('ERROR - $e\nTRACE - $trace');
      return right(ApiError(
        message: 'Failed! Please check your credentials again.',
      ));
    }
  }

  Future<Either<bool, ApiError>> resetPassword({
    required String admissionNumber,
    required String mobileNumber,
  }) async {
    try {
      final response = await dio.post(
        Endpoints.forgotPassword,
        data: {
          'admissionNumber': admissionNumber,
          'email': '',
          'message':
              'Dear ####, Please find your new password; Username- #### , New Password- #### \n ####',
          'sMSMobileNumber': mobileNumber,
          'status': false.toString(),
          'templateId': 1.toString(),
        },
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );

      if (response.statusCode == 200) {
        return left(true);
      } else {
        return left(false);
      }
    } catch (e, trace) {
      debugPrint('ERROR - $e\nTRACE - $trace');
      return right(ApiError(
        message: 'Failed! Please enter valid admission number or phone number.',
      ));
    }
  }

  Future<Either<bool, ApiError>> changePassword({
    required String authToken,
    required int userId,
    required String newPassword,
    required String oldPassword,
  }) async {
    try {
      final response = await dio.post(
        Endpoints.changePassword,
        data: {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
          'repeatNewPassword': newPassword,
          'userId': userId.toString(),
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 201) {
        return left(true);
      } else {
        return left(false);
      }
    } catch (e, trace) {
      debugPrint('ERROR - $e\nTRACE - $trace');
      return right(ApiError(
        message: 'Failed! Please recheck your entered passwords.',
      ));
    }
  }
}
