import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rckdu/models/choise_lang_model.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final List<LangData> countries = LangData.getCounties();
  late List<DropdownMenuItem<LangData>> dropdownMenuItems;
  late LangData dropdownValue;

  List<DropdownMenuItem<LangData>> buildDropdownMenuItems(List countries) {
    List<DropdownMenuItem<LangData>> items = [];

    for (LangData country in countries) {
      items.add(
        DropdownMenuItem(
          value: country,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  country.images,
                  width: 15,
                  height: 15,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(country.name)
              ],
            ),
          ),
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    dropdownMenuItems = buildDropdownMenuItems(countries);
    dropdownValue = dropdownMenuItems[0].value!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(193, 2, 48, 1),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/images/red_lines.svg',
                width: size.width * 0.85,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.07,
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: size.width * 0.25,
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Text(
                  'welcome'.tr(),
                  style: TextStyle(
                    color: const Color.fromRGBO(193, 2, 48, 1),
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  'choiseLang'.tr(),
                  style: TextStyle(
                    color: const Color.fromRGBO(74, 74, 74, 1),
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                selectLang(size, context),
                SizedBox(
                  height: size.height * 0.04,
                ),
                InkWell(
                  onTap: () => context.go('/preloadhome'),
                  child: Container(
                    width: size.width * 0.3,
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(193, 2, 48, 1),
                    ),
                    child: Center(
                      child: Text(
                        'go'.tr(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget selectLang(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromRGBO(74, 74, 74, 1),
          style: BorderStyle.solid,
          width: 0.80,
        ),
      ),
      child: Column(
        children: [
          DropdownButton(
            value: dropdownValue,
            icon: SvgPicture.asset(
              'assets/images/arrow_alng.svg',
              height: size.height * 0.04,
            ),
            elevation: 16,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Color.fromRGBO(74, 74, 74, 1),
            ),
            underline: const SizedBox(),
            onChanged: (value) {
              setState(() {
                dropdownValue = value!;
                context.setLocale(
                  Locale(
                    dropdownValue.langCode,
                    dropdownValue.countryCode,
                  ),
                );
              });
            },
            items: dropdownMenuItems,
          ),
        ],
      ),
    );
  }
}
