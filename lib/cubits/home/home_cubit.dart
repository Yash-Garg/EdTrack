import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../api/data_api.dart';
import '../../injectable.dart';
import '../../models/user/user_model.dart';
import '../config/config_cubit.dart';

part '../../generated/cubits/home/home_cubit.freezed.dart';
part '../../generated/cubits/home/home_cubit.g.dart';
part 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  started() {
    _getDetails();
  }

  _getDetails() async {
    final creds = getIt<ConfigCubit>().state.credentials!;

    final userResponse = await getIt<DataApi>().getUserDetails(
      userId: creds.userId.toString(),
      authToken: creds.accessToken!,
    );

    userResponse.fold(
      (user) => emit(state.copyWith(user: user, loading: false)),
      (err) => emit(state.copyWith(loading: false)),
    );
  }

  reset() {
    emit(HomeState.initial());
  }
}
