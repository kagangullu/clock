import 'package:clock_app/features/view/home/home_view.dart';
import 'package:clock_app/product/init/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then(
    (value) => runApp(EasyLocalization(
      path: 'assets/language',
      supportedLocales: const [
        Locale('en'),
        Locale('tr'),
      ],
      fallbackLocale: Locale('en'),
      child: const ClockApp(),
    )),
  );
  await EasyLocalization.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  Wakelock.enable();
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
      title: "Clock App",
      theme: AppTheme(context).theme,
      home: HomeView(),
    );
  }
}
