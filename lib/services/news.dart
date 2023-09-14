import 'dart:convert';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:rckdu/models/category_model.dart';
import 'package:rckdu/models/news_model.dart';
import 'package:rckdu/services/local_notif.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
List<String> savedNews = [];
List<String> savedCategories = [];

Future<void> checkForNewNews(
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
) async {
  prefs = await SharedPreferences.getInstance();
  savedNews = prefs.getStringList('savedNews') ?? [];

  // Popis odabranih kategorija
  List cc = prefs.getStringList('choiseCat') ?? [];
  List<String> catIds = [];
  for (var element in cc) {
    final el = CategoryModel.fromJson(jsonDecode(element));
    catIds.add(el.id.toString());
  }
  String idString = catIds.join(',');
  log('Popis odabranih kategorija');
  log(idString);

  // Dohvaćanje novosti sa weba
  var response = await http.get(
    Uri.parse('https://rckdu.hr/wp-json/wp/v2/posts?categories=$idString'),
  );
  var jsonData = json.decode(response.body);

  // Podaci sa linka.
  List<int> curNewsId = jsonData.map((news) => news['id']).cast<int>().toList();

  // Provjera je li postoji novi ID objave u spremljenim podacima.
  bool isNewNews(int newsId) {
    return !savedNews.contains(newsId.toString());
  }

  List<int> newIds = curNewsId.where((newsId) => isNewNews(newsId)).toList();

  // Pregled podataka nakon provjere
  log('Link: $curNewsId');
  log('Save: $newIds');

  // Ako postoji nova novost onda ćemo prikazati notifikaciju i spremiti novu novost
  if (newIds.isNotEmpty) {
    LocalNotification.showNotification(
      title: 'Obavijest',
      body: 'Imate nove objave u aplikaciji.',
      flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
    );

    savedNews.addAll(newIds.map((newsId) => newsId.toString()));
    await prefs.setStringList(
      'savedNews',
      savedNews.map((newsId) => newsId.toString()).toList(),
    );
  }
}

class NewsService {
  static Future<NewsModel> getNews(int newsId) async {
    var response = await http.get(
      Uri.parse('https://rckdu.hr/wp-json/wp/v2/posts/$newsId'),
    );
    final result = json.decode(response.body);

    return NewsModel.fromJson(result);
  }
}
