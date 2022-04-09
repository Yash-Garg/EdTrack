import 'package:flutter/material.dart';

import 'app.dart';
import 'injectable.dart';
import 'utils/box.dart';

Future<void> main() async {
  await initializeApp();
  runApp(AttendanceApp());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BoxUtils.initializeHive();
  configureDependencies();
}
