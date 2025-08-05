import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  static  SharedPreferences? _prefs;

  /// يجب استدعاء هذا الميثود قبل استخدام أي ميثود تانية
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ------------ كتابة بيانات ------------
static Future<bool> setString(String key, String value) async {
  if (_prefs == null) {
    await init();
  }
  return await _prefs!.setString(key, value);
}

  static Future<bool> setInt(String key, int value) async {
    return await _prefs!.setInt(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _prefs!.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    return await _prefs!.setDouble(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await _prefs!.setStringList(key, value);
  }

  // ------------ قراءة بيانات ------------
  static String? getString(String key) => _prefs!.getString(key);
  static int? getInt(String key) => _prefs!.getInt(key);
  static bool? getBool(String key) => _prefs!.getBool(key);
  static double? getDouble(String key) => _prefs!.getDouble(key);
  static List<String>? getStringList(String key) => _prefs!.getStringList(key);

  // ------------ حذف بيانات ------------
  static Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }

  static Future<bool> clear() async {
    return await _prefs!.clear();
  }

  // ------------ تحقق من وجود مفتاح ------------
  static bool contains(String key) => _prefs!.containsKey(key);
}
