// ignore_for_file: deprecated_member_use

import 'package:clock_app/features/view/theme/theme_view.dart';
import 'package:clock_app/product/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  const MenuView(this.controller, {super.key});
  final PageController controller;

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(controller: widget.controller),
      body: ThemeView(controller: widget.controller),
    );
  }
}
