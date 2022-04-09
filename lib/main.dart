import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'constants.dart';
import 'src/injectable.dart';

Future<void> main() async {
  await initializeApp();
  runApp(const AkgecErpApp());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(Constants.APP_NAME);
  configureDependencies();
}
