import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import 'cubits/config/config_cubit.dart';
import 'ui/login/login_page.dart';

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ConfigCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.APP_NAME,
        home: const LoginPage(),
      ),
    );
  }
}
