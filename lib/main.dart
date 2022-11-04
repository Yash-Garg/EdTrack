import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'app.dart';
import 'injectable.dart';
import 'simple_bloc_observer.dart';
import 'utils/box.dart';

Future<void> main() async {
  await initializeApp();

  // make workable in web also:-- by hChauhan4862
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(AttendanceApp()),
    storage: storage,
    blocObserver: SimpleBlocObserver(),
  );
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BoxUtils.initializeHive();
  configureDependencies();
}
