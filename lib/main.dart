import 'package:flutter/material.dart';

void main() {
  runApp(const Webtoon());
}

class Webtoon extends StatelessWidget {
  const Webtoon({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text("test"),
    );
  }
}
