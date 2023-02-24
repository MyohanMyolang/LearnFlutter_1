import 'package:app1/models/webtoon_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final WebtoonModel toon;
  const DetailScreen({
    super.key,
    required this.toon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        actions: const [],
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
