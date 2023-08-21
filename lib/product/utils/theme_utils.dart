import 'package:clock_app/product/utils/shared_preferences_utils.dart';
import 'package:flutter/material.dart';

@immutable
class ThemeUtils {
  static Future<String> loadTheme(BuildContext context) async {
    String? storedTheme = await SharedPreferencesUtil.getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    if (storedTheme == null) {
      SharedPreferencesUtil.setTheme(
          isTablet ? 'assets/theme/ipad/1.webp' : 'assets/theme/1.webp');
      return isTablet ? 'assets/theme/ipad/1.webp' : 'assets/theme/1.webp';
    } else {
      return storedTheme;
    }
  }
}
