import 'package:get_storage/get_storage.dart';

class UserStorage {
  static GetStorage storage = GetStorage();

  static void save(String key, String value) {
    storage.write(key, value);
  }

  static String read(String key) {
    return storage.read(key) ?? ''; // ✅ آمن ضد null
  }

  static void delete(String key) {
    storage.remove(key); // ✅ إزالة المفتاح بالكامل
  }
}
