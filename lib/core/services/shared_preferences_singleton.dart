import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _instance;

  /// تهيئة SharedPreferences مرة واحدة
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  /// حفظ قيمة بوليان
  static Future<void> setBool(String key, bool value) async {
    await _instance!.setBool(key, value);
  }

  /// جلب قيمة بوليان
  static bool getBool(String key) {
    return _instance!.getBool(key) ?? false;
  }

  /// حفظ نص
  static Future<void> setString(String key, String value) async {
    await _instance!.setString(key, value);
  }

  /// جلب نص
  static String getString(String key) {
    return _instance!.getString(key) ?? '';
  }

  /// مسح مفتاح معيّن
  static Future<void> remove(String key) async {
    await _instance!.remove(key);
  }

  /// مسح كل البيانات
  static Future<void> clear() async {
    await _instance!.clear();
  }
}
