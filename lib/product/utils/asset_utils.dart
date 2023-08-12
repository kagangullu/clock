import 'package:flutter/material.dart';

@immutable
class AssetUtils {
  String toSvg(String name) => "assets/icons/$name.svg";

  static String getTimeIcon() => AssetUtils().toSvg("time");
  static String getBrushIcon() => AssetUtils().toSvg("brush");
  static String getVoiceIcon() => AssetUtils().toSvg("voice");
  static String getPomodoroIcon() => AssetUtils().toSvg("pomodoro");
}
