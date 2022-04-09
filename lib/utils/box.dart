import 'package:hive_flutter/hive_flutter.dart';

import '../constants.dart';
import '../models/credential/credential_object.dart';

class BoxUtils {
  static Future<void> initializeHive() async {
    await Hive.initFlutter(Constants.HIVE_DB);
    Hive.registerAdapter(CredentialObjectAdapter());
  }
}
