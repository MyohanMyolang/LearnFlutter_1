import 'package:app1/models/webtoon_model.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../services/api_service.dart';

class DetailScreen extends StatelessWidget {
  final WebtoonModel toon;

  const DetailScreen({
    super.key,
    required this.toon,
  });

  @override
  Widget build(BuildContext context) {
    WebtoonState? mainState =
        context.findRootAncestorStateOfType<WebtoonState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(mainState!.modeIcon),
            onPressed: mainState.modeChnage,
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          toon.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: toon.id,
                  child: Container(
                    width: 150,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(10, 10),
                          // color: Theme.of(context)
                          //     .appBarTheme
                          //     .actionsIconTheme!
                          //     .color!
                          //     .withOpacity(0.5),
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.5),
                        )
                      ],
                    ),
                    child: Image.network(
                      toon.thumb,
                      scale: 3,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            showAbout(),
          ],
        ),
      ),
    );
  }

  FutureBuilder<String> showAbout() {
    return FutureBuilder(
      future: ApiService.getToonAbout(toon.id),
      builder: ((context, snapshot) {
        if (snapshot.hasData == true) {
          return Text(
            snapshot.data!,
            style: const TextStyle(fontSize: 18),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}
