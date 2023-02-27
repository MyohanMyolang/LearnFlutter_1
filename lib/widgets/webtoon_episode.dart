import 'package:app1/models/webtoon_episode_model.dart';
import 'package:flutter/material.dart';

class WebtoonEpisode extends StatelessWidget {
  final WebtoonEpisodeModel episodeModel;
  const WebtoonEpisode({
    super.key,
    required this.episodeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          width: 0.3,
          color: Theme.of(context).textTheme.bodyLarge!.color!,
        ),
      )),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(episodeModel.thumb),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 4,
            child: Text(episodeModel.title),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("★ ${episodeModel.rating}"),
                const SizedBox(height: 10),
                Text(episodeModel.date),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
