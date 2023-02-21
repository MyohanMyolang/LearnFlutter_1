import 'package:app1/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Pomodoro());
}

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
        //backgroundColor를 대신하여 쓴 코드이다.
        scaffoldBackgroundColor: const Color(0xFFE7626C),
      ),
      home: const HomeScreen(),
    );
  }
}
