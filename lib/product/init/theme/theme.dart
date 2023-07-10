import 'package:clock_app/product/init/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  late ThemeData theme;

  AppTheme(BuildContext context) {
    theme = ThemeData(
      scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor,
      useMaterial3: true,
      primarySwatch: Colors.orange,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        foregroundColor: ThemeColors.white,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: ThemeColors.white,
        ),
        backgroundColor: ThemeColors.scaffoldBackgroundColor,
      ),
    );
  }
}
