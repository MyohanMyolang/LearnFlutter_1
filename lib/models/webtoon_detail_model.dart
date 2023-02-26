class WebtoonDetailModel {
  late final String thumb, title, id, rating, date;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : thumb = json['thumb'],
        title = json['titme'],
        id = json['id'],
        rating = json['rating'],
        date = json['date'];
}
