import 'package:app1/models/webtoon_episode_model.dart';
import 'package:app1/models/webtoon_model.dart';
import 'package:app1/widgets/webtoon_episode.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final WebtoonModel toon;

  const DetailScreen({
    super.key,
    required this.toon,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String aboutSplited = "";
  bool isAboutOpen = false;
  String about = "";

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
          widget.toon.title,
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
                  tag: widget.toon.id,
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
                      widget.toon.thumb,
                      scale: 3,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            showAbout(),
            const SizedBox(height: 30),
            FutureBuilder(
              future: ApiService.getToonEpisodes(widget.toon.id),
              builder: (context, snapshot) {
                if (snapshot.hasData == true) {
                  return Expanded(
                    child: makeEpisodes(snapshot.data!),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  ListView makeEpisodes(List<WebtoonEpisodeModel> data) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) {
        var episode = data[index];
        return WebtoonEpisode(episodeModel: episode);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
    );
  }

  FutureBuilder<String> showAbout() {
    return FutureBuilder(
      future: ApiService.getToonAbout(widget.toon.id),
      builder: ((context, snapshot) {
        if (snapshot.hasData == true) {
          about = snapshot.data!;
          aboutSplited =
              about.length > 50 ? "${about.substring(0, 50)}…" : about;

          return TextButton(
            onPressed: () {
              print("onPressed");
              if (!isAboutOpen) {
                print("test");
                setState(() {
                  isAboutOpen = !isAboutOpen;
                });
                return;
              }
              setState(() {
                isAboutOpen = !isAboutOpen;
              });
            },
            child: Text(
              isAboutOpen ? about : aboutSplited,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}
