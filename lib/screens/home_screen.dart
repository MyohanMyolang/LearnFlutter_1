import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int DEFAULT_MINUTE = 25;
  static const int DEFAULT_TOTAL_SECONDS = 60 * DEFAULT_MINUTE;

  bool isRunning = false;
  int minute = DEFAULT_MINUTE;
  // Default Minute is 25Minute
  int totalSeconds = DEFAULT_TOTAL_SECONDS;
  late Timer timer;
  int totalPomodoros = 0;

  void onTick(Timer timer) {
    if (totalSeconds == 1) {
      timer.cancel();
      setState(() {
        isRunning = false;
        totalSeconds = 60 * minute;
        totalPomodoros++;
      });

      return;
    }
    setState(() {
      totalSeconds -= 1;
    });
  }

  void onClickPlayBtn() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onClickPauseBtn() {
    timer.cancel();
    setState(() {
      totalSeconds = 60 * minute;
      isRunning = false;
    });
  }

  void onClickReset() {
    setState(() {
      timer.cancel();
      totalSeconds = 60 * minute;
      isRunning = false;
      totalPomodoros = 0;
    });
  }

  String getTimeFormat(int second) {
    var duration = Duration(seconds: second);

    var result = duration.toString().split('.')[0].split(':');

    return "${result[1]}:${result[2]}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                getTimeFormat(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 90,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                    iconSize: 100,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onClickPauseBtn : onClickPlayBtn,
                  ),
                  IconButton(
                    onPressed: onClickReset,
                    icon: const Icon(Icons.repeat_on_outlined),
                    iconSize: 40,
                    color: Theme.of(context).cardColor,
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pmodors',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          "$totalPomodoros",
                          style: TextStyle(
                              fontSize: 55,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
