import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../api/data_api.dart';
import '../../injectable.dart';
import '../../models/user/user_attendance.dart';
import '../../models/user/user_batch.dart';
import '../../models/user/user_model.dart';
import '../config/config_cubit.dart';

part '../../generated/cubits/home/home_cubit.freezed.dart';
part '../../generated/cubits/home/home_cubit.g.dart';
part 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  final _creds = getIt<ConfigCubit>().state.credentials!;

  started() async {
    _getDetails();
    _getBatchDetails();
    await _getAttendance();
    emit(state.copyWith(loading: false));
  }

  refresh() async {
    _getDetails();
    _getBatchDetails();
    await _getAttendance();
  }

  _getDetails() async {
    final userResponse = await getIt<DataApi>().getUserDetails(
      userId: _creds.userId.toString(),
      authToken: _creds.accessToken!,
    );

    userResponse.fold(
      (user) => emit(state.copyWith(user: user)),
      (err) => emit(state.copyWith(hasError: true, loading: false)),
    );
  }

  _getAttendance() async {
    final attResponse = await getIt<DataApi>().getUserAttendance(
      userId: _creds.userId.toString(),
      authToken: _creds.accessToken!,
      rx: _creds.rx.toString(),
      contextId: _creds.contextId!,
    );

    attResponse.fold(
      (attendance) => emit(state.copyWith(attendance: attendance)),
      (err) => emit(state.copyWith(hasError: true, loading: false)),
    );
  }

  _getBatchDetails() async {
    final batchResponse = await getIt<DataApi>().getBatchDetails(
      userId: _creds.userId.toString(),
      authToken: _creds.accessToken!,
      rx: _creds.rx.toString(),
      contextId: _creds.contextId!,
    );

    batchResponse.fold(
      (batch) => emit(state.copyWith(userBatch: batch)),
      (err) => emit(state.copyWith(hasError: true, loading: false)),
    );
  }

  reset() {
    emit(HomeState.initial());
  }
}
