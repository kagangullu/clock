import 'package:clock_app/product/utils/shared_preferences_utils.dart';

class ThemeUtils {
  static Future<String> loadTheme() async {
    String? storedTheme = await SharedPreferencesUtil.getTheme();
    if (storedTheme == null) {
      SharedPreferencesUtil.setTheme('assets/theme/1.png');
      return 'assets/theme/1.png';
    } else {
      return storedTheme;
    }
  }
}
