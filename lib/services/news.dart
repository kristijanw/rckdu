import 'dart:convert';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:rckdu/services/local_notif.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
List<String> savedNews = [];

Future<void> checkForNewNews(
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
) async {
  prefs = await SharedPreferences.getInstance();
  savedNews = prefs.getStringList('savedNews') ?? [];

  // Dohvaćanje novosti sa weba
  var response = await http.get(
    Uri.parse('https://rckdu.hr/wp-json/wp/v2/posts'),
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
      title: 'Nova obavijest',
      body: 'Poruka',
      flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
    );

    savedNews.addAll(newIds.map((newsId) => newsId.toString()));
    await prefs.setStringList(
      'savedNews',
      savedNews.map((newsId) => newsId.toString()).toList(),
    );
  }
}
