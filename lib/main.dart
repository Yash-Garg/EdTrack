import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart';
import 'src/constants.dart';
import 'src/injectable.dart';

Future<void> main() async {
  await initializeApp();
  runApp(const AttendanceApp());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(Constants.APP_NAME);
  configureDependencies();
}
