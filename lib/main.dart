import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'injectable.dart';
import 'utils/box.dart';

Future<void> main() async {
  await initializeApp();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(AttendanceApp()),
    storage: storage,
  );
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BoxUtils.initializeHive();
  configureDependencies();
}
