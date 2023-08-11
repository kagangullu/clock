import 'package:flutter/material.dart';

@immutable
class ThemeModel {
  final String themeTitle;
  final String themePath;

  const ThemeModel({
    required this.themeTitle,
    required this.themePath,
  });
}
