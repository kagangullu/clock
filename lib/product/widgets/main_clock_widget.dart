// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks

import 'dart:async';
import 'package:clock_app/product/enum/clock_text_enum.dart';
import 'package:clock_app/product/init/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

class MainClockWidget extends StatefulWidget {
  const MainClockWidget({super.key, required this.clockTextEnum});
  final ClockTextEnum clockTextEnum;

  @override
  State<MainClockWidget> createState() => _MainClockWidgetState();
}

class _MainClockWidgetState extends State<MainClockWidget> {
  String? _timeString;
  String? _timeFormat;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    switch (widget.clockTextEnum) {
      case ClockTextEnum.hour:
        _timeFormat = "hh";
        break;
      case ClockTextEnum.minute:
        _timeFormat = "mm";
        break;
      case ClockTextEnum.second:
        _timeFormat = "ss";
        break;
      default:
    }
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
      if (widget.clockTextEnum == ClockTextEnum.hour) {
        if (_timeString!.characters.first == "0") {
          _timeString = _timeString!.characters.string[1];
        }
      }
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat(_timeFormat).format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: context.height / 1.2,
        decoration: BoxDecoration(
          color: ThemeColors.clockBlack,
          borderRadius: context.normalBorderRadius,
        ),
        child: Center(
          child: Text(
            _timeString!,
            style: context.textTheme.displayLarge?.copyWith(
              color: ThemeColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 160,
            ),
          ),
        ),
      ),
    );
  }
}
