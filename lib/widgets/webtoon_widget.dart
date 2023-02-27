import "package:app1/models/webtoon_model.dart";
import "package:app1/screens/detail_screen.dart";
import "package:flutter/material.dart";

class WebtoonWidget extends StatelessWidget {
  const WebtoonWidget({
    super.key,
    required this.toon,
  });
  final WebtoonModel toon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(toon: toon),
            allowSnapshotting: false,
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: toon.id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Theme.of(context)
                        .appBarTheme
                        .actionsIconTheme!
                        .color!
                        .withOpacity(0.5),
                  )
                ],
              ),
              child: Image.network(toon.thumb),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            toon.title,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
