// ignore_for_file: deprecated_member_use

import 'package:clock_app/features/view/home/menu_view.dart';
import 'package:clock_app/product/enum/clock_text_enum.dart';
import 'package:clock_app/product/utils/theme_utils.dart';
import 'package:clock_app/product/widgets/main_clock_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          const _ClockView(),
          MenuView(controller),
        ],
      ),
    );
  }
}

class _ClockView extends StatefulWidget {
  const _ClockView();

  @override
  State<_ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<_ClockView> {
  late String themeValue = 'assets/theme/1.webp';

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  loadTheme() async {
    themeValue = await ThemeUtils.loadTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight, // Ekran yüksekliği kadar
      width: screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(themeValue),
          fit: BoxFit.cover,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MainClockWidget(clockTextEnum: ClockTextEnum.hour),
          MainClockWidget(clockTextEnum: ClockTextEnum.minute),
        ],
      ),
    );
  }
}
