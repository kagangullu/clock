import 'dart:async';
import 'package:clock_app/features/view/pomodoro/pomodoro_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin PomodoroOperationMixin on State<PomodoroView> {
  static const String POMODORO = "pomodoro";
  static const String SHORT_BREAK = "shortBreak";
  static const String LONG_BREAK = "longBreak";

  String mainButtonAction = "start";
  String focus = "time to focus";
  String message = "time to focus";
  String rest = "time to take a break";

  var timerDetails = {
    "pomodoro": 25,
    "shortBreak": 5,
    "longBreak": 15,
    "longBreakInterval": 4,
    "session": 0,
    "mode": "pomodoro",
    "remainingTime": {"total": 25 * 60, "minute": 25, "second": 0}
  };
  late Timer interval = Timer(const Duration(seconds: 1), () {});
  String minutes = "25";
  String seconds = "00";

  List<String> tasks = [];
  String currentTask = "your task";

  void switchMode(String mode) {
    stopTimer();
    timerDetails["mode"] = mode;
    int time = (timerDetails[mode] ?? 0) as int;
    timerDetails["remainingTime"] = {
      "total": time * 60,
      "minute": timerDetails[mode],
      "second": 0
    };

    setState(() {
      if (mode == POMODORO) {
        message = focus;
      } else {
        message = rest;
      }
    });

    updateClock();
  }

  void updateClock() {
    Map remainingTime = timerDetails["remainingTime"] as Map;
    setState(() {
      minutes = "${remainingTime["minute"]}".padLeft(2, "0");
      seconds = "${remainingTime["second"]}".padLeft(2, "0");
    });
  }

  void startTimer() {
    Map remainingTime = timerDetails["remainingTime"] as Map;
    int total = remainingTime["total"];
    var endTime = DateTime.now().add(Duration(seconds: total));

    if (timerDetails["mode"] == POMODORO) {
      timerDetails["session"] = (timerDetails["session"] as int) + 1;
    }

    setState(() {
      mainButtonAction = "stop";
    });

    interval = Timer.periodic(const Duration(seconds: 1), (timer) {
      timerDetails["remainingTime"] = getRemainingTime(endTime);
      updateClock();

      Map remainingTime = timerDetails["remainingTime"] as Map;
      int total = remainingTime["total"];
      if (total <= 0) {
        interval.cancel();
        HapticFeedback.vibrate();

        switch (timerDetails["mode"]) {
          case POMODORO:
            int timerSession = timerDetails["session"] as int;
            int longBreakInterval = timerDetails["longBreakInterval"] as int;

            if (timerSession % longBreakInterval == 0) {
              switchMode(LONG_BREAK);
            } else {
              switchMode(SHORT_BREAK);
            }
            break;
          default:
            switchMode(POMODORO);
        }
        startTimer();
      }
    });
  }

  void stopTimer() {
    interval.cancel();
    setState(() {
      mainButtonAction = "start";
    });
  }

  Map<String, int> getRemainingTime(DateTime endTime) {
    DateTime currentTime = DateTime.now();
    Duration different = endTime.difference(currentTime);

    int total = different.inSeconds;
    int minute = different.inMinutes;
    int second = total % 60;

    return {"total": total, "minute": minute, "second": second};
  }
}
