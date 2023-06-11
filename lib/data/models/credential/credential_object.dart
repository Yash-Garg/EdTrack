import 'package:hive/hive.dart';

part '../../../generated/data/models/credential/credential_object.g.dart';

@HiveType(typeId: 0)
class CredentialObject extends HiveObject {
  @HiveField(0)
  String? accessToken;

  @HiveField(1)
  String? tokenType;

  @HiveField(2)
  int? userId;

  @HiveField(3)
  String? rx;

  @HiveField(4)
  String? issued;

  @HiveField(5)
  String? expires;

  @HiveField(6)
  String? contextId;
}
