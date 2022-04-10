import 'package:hive_flutter/hive_flutter.dart';

import '../models/credential/credential_object.dart';
import '../models/token/token_model.dart';
import 'constants.dart';

class BoxUtils {
  static Future<void> initializeHive() async {
    await Hive.initFlutter(Constants.HIVE_DB);
    Hive.registerAdapter(CredentialObjectAdapter());
  }

  static Future<bool> checkLogin() async {
    final box = await Hive.openBox<CredentialObject>(BoxConstants.credentials);
    if (box.containsKey(BoxConstants.credentialsKey)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> setAccount({
    required TokenModel tokenModel,
  }) async {
    final box = await Hive.openBox<CredentialObject>(BoxConstants.credentials);
    final creds = CredentialObject()
      ..accessToken = tokenModel.accessToken
      ..expires = tokenModel.expires
      ..issued = tokenModel.issued
      ..userId = int.parse(tokenModel.userId)
      ..tokenType = tokenModel.tokenType
      ..rx = tokenModel.rx;

    box.put(BoxConstants.credentialsKey, creds);
    return true;
  }

  static Future<CredentialObject?> getCredentialBox() async {
    final box = await Hive.openBox<CredentialObject>(BoxConstants.credentials);
    if (box.values.isEmpty) {
      return null;
    }

    CredentialObject creds = box.get(BoxConstants.credentialsKey)!;
    return creds;
  }
}
