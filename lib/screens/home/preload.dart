import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:rckdu/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class HomePreload extends StatefulWidget {
  const HomePreload({super.key});

  @override
  State<HomePreload> createState() => _HomePreloadState();
}

class _HomePreloadState extends State<HomePreload> {
  List<CategoryModel> categoriesData = [];
  List selectedCat = [];

  Future<void> fetchCat() async {
    var response = await http.get(
      Uri.parse('https://rckdu.hr/wp-json/wp/v2/categories'),
    );
    final List<dynamic> result = json.decode(response.body);

    setState(() {
      categoriesData =
          result.map((category) => CategoryModel.fromJson(category)).toList();
    });
  }

  void fetchSelectedCat() async {
    final prefs = await SharedPreferences.getInstance();
    List cc = prefs.getStringList('choiseCat') ?? [];

    setState(() {
      selectedCat = cc;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCat();
    fetchSelectedCat();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage("assets/images/preloadhome.png"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.07,
                  vertical: size.height * 0.03,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(252, 252, 252, 0.80),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'preload'.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: size.height * 0.02,
                            color: const Color.fromRGBO(74, 74, 74, 1),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Image.asset(
                          "assets/images/eu-logotipi.png",
                          width: double.infinity,
                          height: size.height * 0.25,
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (selectedCat.isNotEmpty) ...{
                Column(
                  children: [
                    Text(
                      'selectedc'.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Wrap(
                      children: [
                        ...selectedCat.map((e) {
                          final el = CategoryModel.fromJson(jsonDecode(e));
                          return Container(
                            margin: const EdgeInsets.only(
                              right: 10,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffC10230),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              el.name.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              },
              SizedBox(
                height: size.height * 0.01,
              ),
              Column(
                children: [
                  Text(
                    'preloadTxt'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.03,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _showMultiSelect(context, categoriesData);
                            },
                            child: Container(
                              width: size.width * 0.5,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromRGBO(193, 2, 48, 1),
                              ),
                              child: Center(
                                child: Text(
                                  'preloadButton'.tr(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        if (selectedCat.isNotEmpty) ...{
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                context.go('/navigation');
                              },
                              child: Container(
                                width: size.width * 0.5,
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 67, 67, 67),
                                ),
                                child: Center(
                                  child: Text(
                                    'skip'.tr(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        }
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMultiSelect(
      BuildContext context, List<CategoryModel> categoriesData) async {
    final items = categoriesData
        .map((cat) => MultiSelectItem<CategoryModel>(cat, cat.name ?? ''))
        .toList();

    List<CategoryModel> selectedCat = [];

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return MultiSelectBottomSheet(
          items: items,
          initialValue: selectedCat,
          onConfirm: (values) async {
            List<String> choiseCategory =
                values.map((item) => jsonEncode(item.toJson())).toList();

            SharedPreferences pref = await SharedPreferences.getInstance();

            await pref.setStringList(
              'choiseCat',
              choiseCategory,
            );

            Timer(
              const Duration(seconds: 1),
              () => context.go('/navigation'),
            ).cancel;
          },
          maxChildSize: 0.9,
          title: Text(
            'preloadChoiseCat'.tr(),
            textAlign: TextAlign.center,
          ),
          cancelText: Text(
            'cancel'.tr(),
            style: const TextStyle(
              color: Color(0xffC10230),
            ),
          ),
          confirmText: Text(
            'okej'.tr(),
            style: const TextStyle(
              color: Color(0xffC10230),
            ),
          ),
          checkColor: Colors.white,
          selectedColor: const Color(0xffC10230),
        );
      },
    );
  }
}
