import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/cubits/config/config_cubit.dart';
import 'injectable.dart';
import 'utils/keys.dart';
import 'ui/theme_data.dart';
import 'ui/splash/splash_screen.dart';
import 'utils/box.dart';
import 'utils/constants.dart';

class AttendanceApp extends StatefulWidget {
  const AttendanceApp({super.key});

  @override
  State<AttendanceApp> createState() => _AttendanceAppState();
}

class _AttendanceAppState extends State<AttendanceApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      getIt<ConfigCubit>().started();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfigCubit, ConfigState>(
      bloc: getIt<ConfigCubit>(),
      listener: (context, state) async {
        debugPrint('ConfigCubit - listener');
        BoxUtils.checkLogin().then((isLoggedIn) async {
          if (isLoggedIn) {
            debugPrint('ConfigCubit - isLoggedIn');
          } else {
            debugPrint('ConfigCubit - isLoggedOut');
          }
        });
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.APP_NAME,
        home: SplashScreen(key: WidgetKeys.splashScreen),
        theme: AppTheme.themeData,
      ),
    );
  }
}
