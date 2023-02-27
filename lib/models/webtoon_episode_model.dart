class WebtoonEpisodeModel {
  late final String thumb, title, id, rating, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : thumb = json['thumb'],
        title = json['title'],
        id = json['id'],
        rating = json['rating'],
        date = json['date'];
}
