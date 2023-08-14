import 'package:clock_app/product/utils/shared_preferences_utils.dart';
import 'package:flutter/material.dart';

@immutable
class ThemeUtils {
  static Future<String> loadTheme() async {
    String? storedTheme = await SharedPreferencesUtil.getTheme();
    if (storedTheme == null) {
      SharedPreferencesUtil.setTheme('assets/theme/1.webp');
      return 'assets/theme/1.webp';
    } else {
      return storedTheme;
    }
  }
}
