import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';
import 'extensions.dart';
import '../models/credential/credential_object.dart';

class BoxUtils {
  static Future<void> initializeHive() async {
    await Hive.initFlutter(Constants.HIVE_DB);
    Hive.registerAdapter(CredentialObjectAdapter());
  }

  static Future<bool> checkLogin() async {
    final box = await Hive.openBox<CredentialObject>(BoxConstants.credentials);
    if (!box.values.first.accessToken.isNullOrEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
