import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await (_prefs ??= await SharedPreferences.getInstance()).setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = _prefs ??= await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> setBool(String key, bool value) async {
    await (_prefs ??= await SharedPreferences.getInstance()).setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    final prefs = _prefs ??= await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
