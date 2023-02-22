import 'package:app1/screens/home_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Webtoon());
}

enum UserTheme {
  dark,
  light,
}

class Webtoon extends StatefulWidget {
  const Webtoon({super.key});

  @override
  State<Webtoon> createState() => _WebtoonState();
}

class _WebtoonState extends State<Webtoon> {
  UserTheme theme = UserTheme.dark;

  void changeDarkMode() {
    setState(() {
      theme = UserTheme.dark;
    });
  }

  void changeLightMode() {
    setState(() {
      theme = UserTheme.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme == UserTheme.dark ? customDarkTheme() : customLightTheme(),
      home: theme == UserTheme.dark
          ? HomeScreen(
              changeMode: changeLightMode,
              modeIcon: Icons.light_mode,
            )
          : HomeScreen(
              changeMode: changeDarkMode,
              modeIcon: Icons.dark_mode,
            ),
    );
  }

  ThemeData customLightTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme().copyWith(
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent,
      ),
    );
  }

  ThemeData customDarkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 29, 30, 30),
      appBarTheme: const AppBarTheme().copyWith(
        actionsIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 29, 30, 30),
      ),
    );
  }
}
