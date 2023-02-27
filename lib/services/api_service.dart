import 'dart:convert';

import 'package:app1/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

import '../models/webtoon_episode_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";
  static const String episodes = "episodes";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> toonInstances = [];
    final Uri url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        toonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return toonInstances;
    }
    throw Error();
  }

  static Future<String> getToonAbout(String id) async {
    final Uri url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['about'];
    }

    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getToonEpisodes(String id) async {
    List<WebtoonEpisodeModel> episodeInstances = [];
    final Uri url = Uri.parse("$baseUrl/$id/$episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodeInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodeInstances;
    }
    throw Error();
  }
}
