// ignore_for_file: deprecated_member_use

import 'package:clock_app/product/enum/clock_text_enum.dart';
import 'package:clock_app/product/init/theme/theme_colors.dart';
import 'package:clock_app/product/widgets/main_clock_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          _ClockView(),
          _MenuView(),
        ],
      ),
    );
  }
}

class _ClockView extends StatelessWidget {
  const _ClockView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.horizontalPaddingMedium,
        child: Row(
          children: [
            const MainClockWidget(clockTextEnum: ClockTextEnum.hour),
            context.emptySizedWidthBoxLow3x,
            const MainClockWidget(clockTextEnum: ClockTextEnum.minute),
            context.emptySizedWidthBoxLow3x,
            const MainClockWidget(clockTextEnum: ClockTextEnum.second),
          ],
        ),
      ),
    );
  }
}

class _MenuView extends StatefulWidget {
  const _MenuView();

  @override
  State<_MenuView> createState() => __MenuViewState();
}

class __MenuViewState extends State<_MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: ThemeColors.scaffoldBackgroundColor,
        child: ListView(
          children: [
            ListTile(
              leading: SvgPicture.asset("assets/icons/brush.svg"),
              onTap: () {},
              title: const Text(
                "Temalar",
                style: TextStyle(
                  color: ThemeColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/icons/voice.svg"),
              onTap: () {},
              title: const Text(
                "Sesler",
                style: TextStyle(
                  color: ThemeColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/icons/timer.svg"),
              onTap: () {},
              title: const Text(
                "Kronometre",
                style: TextStyle(
                  color: ThemeColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/icons/pomodora.svg"),
              onTap: () {},
              title: const Text(
                "Pomodora",
                style: TextStyle(
                  color: ThemeColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/icons/sand_watch.svg"),
              onTap: () {},
              title: const Text(
                "Geri Sayım",
                style: TextStyle(
                  color: ThemeColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Temalar"),
      ),
    );
  }
}
