import 'package:clock_app/features/mixin/pomodoro_operation_mixin.dart';
import 'package:clock_app/features/view/home/menu_view.dart';
import 'package:clock_app/product/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          PomodoroView(),
          MenuView(controller),
        ],
      ),
    );
  }
}

class PomodoroView extends StatefulWidget {
  const PomodoroView({super.key});

  @override
  State<PomodoroView> createState() => _PomodoroViewState();
}

class _PomodoroViewState extends State<PomodoroView>
    with PomodoroOperationMixin {
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
    return Center(
      child: GestureDetector(
        onTap: () {
          if (mainButtonAction == "start") {
            startTimer();
          } else {
            stopTimer();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(themeValue),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    minutes,
                    style: context.textTheme.headlineLarge,
                  ),
                  Text(
                    seconds,
                    style: context.textTheme.headlineLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
