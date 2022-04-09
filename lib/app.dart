import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/config/config_cubit.dart';
import 'injectable.dart';
import 'ui/login/login_page.dart';
import 'utils/box.dart';
import 'utils/constants.dart';

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfigCubit, ConfigState>(
      bloc: getIt<ConfigCubit>()..started(),
      listener: (context, state) async {
        debugPrint('ConfigCubit - listener');
        BoxUtils.checkLogin().then((isLoggedIn) async {
          if (isLoggedIn) {
            debugPrint('ConfigCubit - isLoggedIn');
            final creds = await BoxUtils.getCredentialBox();
            debugPrint(creds?.accessToken);
          }
        });
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.APP_NAME,
        // TODO: Use a SplashScreen, also save ConfigCubit state using HydratedBloc
        home: LoginPage(),
      ),
    );
  }
}
