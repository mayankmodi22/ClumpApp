import 'package:clump_app/LocalData/keyStorage.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageutils {
  static setString({required String key, required String value}) {
    final box = GetStorage();
    box.write(key, value);
  }

  static getValue({required String key}) {
    final box = GetStorage();
    return box.read(KeyStorage.user);
  }

  static userIFNull({required String key, required String value}) {
    final box = GetStorage();
    box.writeIfNull(KeyStorage.user, value);
  }
}
