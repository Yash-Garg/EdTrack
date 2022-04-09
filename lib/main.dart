import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'constants.dart';
import 'injectable.dart';

Future<void> main() async {
  await initializeApp();
  runApp(const AttendanceApp());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(Constants.APP_NAME);
  configureDependencies();
}
