import 'dart:async';
import 'package:clock_app/product/enum/clock_text_enum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

class MainClockWidget extends StatefulWidget {
  const MainClockWidget({
    super.key,
    required this.clockTextEnum,
  });
  final ClockTextEnum clockTextEnum;

  @override
  State<MainClockWidget> createState() => _MainClockWidgetState();
}

class _MainClockWidgetState extends State<MainClockWidget> {
  String? _timeString;
  String? _timeFormat;

  @override
  void initState() {
    switch (widget.clockTextEnum) {
      case ClockTextEnum.hour:
        _timeFormat = "hh";
        break;
      case ClockTextEnum.minute:
        _timeFormat = "mm";
        break;

      default:
    }
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());

    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    if (mounted) {
      setState(() {
        _timeString = formattedDateTime;
      });
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat(_timeFormat).format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString!,
      style: context.textTheme.headlineLarge,
    );
  }
}
