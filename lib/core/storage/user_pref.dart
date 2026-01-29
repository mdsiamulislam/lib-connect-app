import 'package:get_storage/get_storage.dart';

class UserPref {
  static final GetStorage _box = GetStorage();

  static bool isLoggedIn() {
    return _box.read('isLoggedIn') ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    await _box.write('isLoggedIn', value);
  }

  static String? name() {
    return _box.read('name');
  }

  static Future<void> setName(String value) async {
    await _box.write('name', value);
  }

  static String? accessToken() {
    return _box.read('accessToken');
  }

  static Future<void> setAccessToken(String value) async {
    await _box.write('accessToken', value);
  }




}