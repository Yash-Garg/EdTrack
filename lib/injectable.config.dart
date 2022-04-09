// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/login_api.dart' as _i4;
import 'cubits/login/login_cubit.dart' as _i5;
import 'injectable_module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.factory<_i3.Dio>(() => injectableModule.dio);
  gh.lazySingleton<_i4.LoginApi>(() => _i4.LoginApi(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i5.LoginCubit>(() => _i5.LoginCubit());
  return get;
}

class _$InjectableModule extends _i6.InjectableModule {}
