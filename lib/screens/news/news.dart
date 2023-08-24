import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rckdu/models/news_model.dart';
import 'package:rckdu/screens/news/widgets/card_news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List newsData = [];

  Future<void> fetchNews() async {
    var response = await http.get(
      Uri.parse('https://rckdu.hr/wp-json/wp/v2/posts'),
    );
    var jsonData = json.decode(response.body);

    setState(() {
      newsData = jsonData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(193, 2, 48, 1),
        title: Text(
          'newsTitle'.tr(),
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.03,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchNews(),
        color: const Color.fromRGBO(193, 2, 48, 1),
        child: newsData.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.only(top: 30),
                itemCount: newsData.length,
                itemBuilder: (BuildContext context, int index) {
                  final news = NewsModel.fromJson(newsData[index]);

                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      bottom: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: NewsWidget(data: news),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(
                color: Color.fromRGBO(193, 2, 48, 1),
              )),
      ),
    );
  }
}
