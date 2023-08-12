import 'package:clock_app/features/view/home/home_view.dart';
import 'package:clock_app/product/init/constants/app_constants.dart';
import 'package:clock_app/product/init/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  await AppConstants.appInitilaze();
  runApp(
    EasyLocalization(
      path: AppConstants.langAssetPath,
      supportedLocales: AppConstants.supportedLocales,
      fallbackLocale: AppConstants.fallBackLocale,
      child: const ClockApp(),
    ),
  );
}

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme(context).theme,
      home: HomeView(),
    );
  }
}
