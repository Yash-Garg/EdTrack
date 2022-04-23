import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../models/error/api_error.dart';
import '../models/subject/subject_info_model.dart';
import '../models/user/user_attendance.dart';
import '../models/user/user_batch.dart';
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

  Future<Either<Attendance, ApiError>> getUserAttendance({
    required String userId,
    required String authToken,
    required String rx,
    required String contextId,
  }) async {
    try {
      final response = await dio.get(
        '${Endpoints.attendanceDetails}?isDateWise=false&termId=0&userId=$userId&y=0',
        options: Options(
          responseType: ResponseType.json,
          headers: {
            'authorization': 'Bearer $authToken',
            'X-UserId': userId,
            'X-RX': rx,
            'X-ContextId': contextId,
          },
        ),
      );

      final attendanceData = Attendance.fromJson(response.data);

      debugPrint(
        'ATTENDANCE - ${attendanceData.stdSubAtdDetails.overallPercentage}',
      );
      return left(attendanceData);
    } catch (e, trace) {
      debugPrint('ERROR - $e\nTRACE - $trace');
      return right(ApiError(message: 'Failed to fetch details'));
    }
  }

  Future<Either<UserBatch, ApiError>> getBatchDetails({
    required String userId,
    required String authToken,
    required String rx,
    required String contextId,
  }) async {
    try {
      final response = await dio.get(
        Endpoints.batchDetails,
        options: Options(
          responseType: ResponseType.json,
          headers: {
            'authorization': 'Bearer $authToken',
            'X-UserId': userId,
            'X-RX': rx,
            'X-ContextId': contextId,
          },
        ),
      );

      final batchDetails = UserBatch.fromJson(response.data[0]);

      debugPrint('BATCH - ${batchDetails.batchName}');
      return left(batchDetails);
    } catch (e, trace) {
      debugPrint('ERROR - $e\nTRACE - $trace');
      return right(ApiError(message: 'Failed to fetch batch details'));
    }
  }

  Future<Either<List<SubjectDetails>, ApiError>> getSubjectDetails({
    required String authToken,
    required int batchId,
  }) async {
    try {
      final response = await dio.get(
        '${Endpoints.subjectDetails}/$batchId',
        options: Options(
          responseType: ResponseType.json,
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      final mainSubjectDetails = List<SubjectDetails>.from(
        response.data[0]['subject'].map((sub) => SubjectDetails.fromJson(sub)),
      );

      final electiveSubjectDetails = List<SubjectDetails>.from(
        response.data[1]['subject'].map((sub) => SubjectDetails.fromJson(sub)),
      );

      final subjectDetails = [...mainSubjectDetails, ...electiveSubjectDetails];

      debugPrint(subjectDetails.first.name);
      return left(subjectDetails);
    } catch (e, trace) {
      debugPrint('ERROR - $e\nTRACE - $trace');
      return right(ApiError(message: 'Failed to fetch subject details.'));
    }
  }
}
