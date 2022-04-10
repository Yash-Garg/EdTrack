// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/login_api.dart' as _i6;
import 'cubits/config/config_cubit.dart' as _i3;
import 'cubits/home/home_cubit.dart' as _i5;
import 'injectable_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.ConfigCubit>(() => _i3.ConfigCubit());
  gh.factory<_i4.Dio>(() => injectableModule.dio);
  gh.lazySingleton<_i5.HomeCubit>(() => _i5.HomeCubit());
  gh.lazySingleton<_i6.LoginApi>(() => _i6.LoginApi(dio: get<_i4.Dio>()));
  return get;
}

class _$InjectableModule extends _i7.InjectableModule {}
