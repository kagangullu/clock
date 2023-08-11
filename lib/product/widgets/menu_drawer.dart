// ignore_for_file: deprecated_member_use

import 'package:clock_app/features/view/home/home_view.dart';
import 'package:clock_app/features/view/pomodoro/pomodoro_view.dart';
import 'package:clock_app/features/view/theme/theme_view.dart';
import 'package:clock_app/features/view/voice/voices_view.dart';
import 'package:clock_app/product/init/lang/locale_keys.g.dart';
import 'package:clock_app/product/init/theme/theme_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeColors.scaffoldBackgroundColor,
      child: ListView(
        children: [
          _MyListTile(
            leading: SvgPicture.asset(
              "assets/icons/time.svg",
              color: ThemeColors.white,
              height: 25,
            ),
            pushWidget: HomeView(),
            title: LocaleKeys.clock.tr(),
          ),
          _MyListTile(
            leading: SvgPicture.asset("assets/icons/brush.svg"),
            pushWidget: ThemeView(),
            title: LocaleKeys.themes.tr(),
          ),
          _MyListTile(
            leading: SvgPicture.asset("assets/icons/voice.svg"),
            pushWidget: VoicesView(),
            title: LocaleKeys.sounds.tr(),
          ),
          _MyListTile(
            leading: SvgPicture.asset("assets/icons/pomodoro.svg"),
            pushWidget: PomodoroTimer(),
            title: LocaleKeys.pomodoro.tr(),
          ),
        ],
      ),
    );
  }
}

class _MyListTile extends StatelessWidget {
  const _MyListTile({
    required this.leading,
    required this.pushWidget,
    required this.title,
  });
  final Widget leading;
  final Widget pushWidget;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => pushWidget,
          ),
        );
      },
      title: Text(
        title,
        style: TextStyle(
          color: ThemeColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
