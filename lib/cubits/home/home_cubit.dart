import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../api/data_api.dart';
import '../../injectable.dart';
import '../../models/user/user_attendance.dart';
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
    await _getDetails();
    // await _getAttendance();
    emit(state.copyWith(loading: false));
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

  reset() {
    emit(HomeState.initial());
  }
}
