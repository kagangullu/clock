import 'package:clock_app/features/view/home_view.dart';
import 'package:clock_app/product/init/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClockApp());
}

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clock App",
      theme: AppTheme(context).theme,
      home: const HomeView(),
    );
  }
}
