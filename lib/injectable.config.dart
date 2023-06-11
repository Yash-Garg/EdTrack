// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/data_api.dart' as _i8;
import 'api/login_api.dart' as _i7;
import 'cubits/attendance/attendance_cubit.dart' as _i3;
import 'cubits/config/config_cubit.dart' as _i4;
import 'cubits/home/home_cubit.dart' as _i6;
import 'injectable_module.dart' as _i9;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.AttendanceCubit>(() => _i3.AttendanceCubit());
  gh.lazySingleton<_i4.ConfigCubit>(() => _i4.ConfigCubit());
  gh.factory<_i5.Dio>(() => injectableModule.dio);
  gh.lazySingleton<_i6.HomeCubit>(() => _i6.HomeCubit());
  gh.lazySingleton<_i7.LoginApi>(() => _i7.LoginApi(dio: gh<_i5.Dio>()));
  gh.lazySingleton<_i8.DataApi>(() => _i8.DataApi(gh<_i5.Dio>()));
  return getIt;
}

class _$InjectableModule extends _i9.InjectableModule {}
