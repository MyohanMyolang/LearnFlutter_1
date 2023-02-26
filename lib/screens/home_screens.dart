import 'package:app1/models/webtoon_model.dart';
import 'package:app1/services/api_service.dart';
import 'package:app1/widgets/webtoon_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback changeMode;
  final IconData modeIcon;
  Future<List<WebtoonModel>> toons = ApiService.getTodaysToons();
  HomeScreen({
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
      body: FutureBuilder(
        future: toons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 5,
              backgroundColor: Colors.cyanAccent,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var toon = snapshot.data![index];
        return Webtoon_widget(toon: toon);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }
}
