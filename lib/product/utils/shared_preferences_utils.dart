import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static const String themeKey = 'theme';

  static Future<void> setTheme(String themeValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeKey, themeValue);
  }

  static Future<String?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(themeKey);
  }

  static Future<void> loadTheme(String newImagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeKey, newImagePath);
  }
}
