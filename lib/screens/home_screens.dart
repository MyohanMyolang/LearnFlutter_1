import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback changeMode;
  final IconData modeIcon;

  const HomeScreen({
    super.key,
    required this.changeMode,
    required this.modeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(modeIcon),
            onPressed: changeMode,
          )
        ],
        elevation: 0,
        centerTitle: true,
        //backgroundColor: Colors.white,
        //foregroundColor: Colors.green,
        title: const Text(
          "Today's Toons",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
