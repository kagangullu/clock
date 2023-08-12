import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

@immutable
class AppConstants {
  static const String appName = "Clock App";
  static const String langAssetPath = "assets/language";
  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('tr'),
    Locale('ru'),
  ];
  static const Locale fallBackLocale = Locale('en');

  static Future<void> appInitilaze() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Wakelock.enable();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
