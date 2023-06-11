import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'injectable.dart';
import 'utils/simple_bloc_observer.dart';
import 'utils/box.dart';

Future<void> main() async {
  await initializeApp();

  Bloc.observer = SimpleBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(AttendanceApp());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BoxUtils.initializeHive();
  configureDependencies();
}
