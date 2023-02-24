import 'package:app1/screens/home_screens.dart';
import 'package:audioplayers/audioplayers.dart';
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
  State<Webtoon> createState() => WebtoonState();
}

class WebtoonState extends State<Webtoon> {
  UserTheme theme = UserTheme.dark;
  IconData modeIcon = Icons.light_mode;
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void onClickSwitch() async {
    await player.stop();
    await player.play(
      AssetSource('audios/Switch.mp3'),
    );
  }

  void changeDarkMode() {
    onClickSwitch();
    setState(() {
      theme = UserTheme.dark;
      modeIcon = Icons.light_mode;
    });
  }

  void changeLightMode() {
    onClickSwitch();
    setState(() {
      theme = UserTheme.light;
      modeIcon = Icons.dark_mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme == UserTheme.dark ? customDarkTheme() : customLightTheme(),
      home: theme == UserTheme.dark
          ? HomeScreen(
              changeMode: changeLightMode,
              modeIcon: modeIcon,
            )
          : HomeScreen(
              changeMode: changeDarkMode,
              modeIcon: modeIcon,
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
