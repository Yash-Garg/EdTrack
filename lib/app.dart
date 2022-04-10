import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/config/config_cubit.dart';
import 'cubits/home/home_cubit.dart';
import 'injectable.dart';
import 'ui/splash/splash_screen.dart';
import 'utils/box.dart';
import 'utils/constants.dart';

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return BlocListener<ConfigCubit, ConfigState>(
      bloc: getIt<ConfigCubit>()..started(),
      listener: (context, state) async {
        debugPrint('ConfigCubit - listener');
        BoxUtils.checkLogin().then((isLoggedIn) async {
          if (isLoggedIn) {
            debugPrint('ConfigCubit - isLoggedIn');
            getIt<HomeCubit>().started();
          }
        });
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.APP_NAME,
        home: SplashScreen(),
      ),
    );
  }
}
