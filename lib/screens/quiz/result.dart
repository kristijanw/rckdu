import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback resetQuiz;
  final int resultScore;
  final dynamic allprofession;

  const Result({
    Key? key,
    required this.resetQuiz,
    required this.resultScore,
    required this.allprofession,
  }) : super(key: key);

  Widget get resultPhrase {
    for (var zanimanje in allprofession) {
      // ignore: avoid_print
      print('Zanimanje: ${zanimanje['title']}, Bodovi: ${zanimanje['score']}');
    }

    // Pronađite najveći broj bodova
    int maxScore = -1;
    for (var profession in allprofession) {
      if (profession['score'] > maxScore) {
        maxScore = profession['score'];
      }
    }

    // Prikazite zanimanja s najviše bodova
    List<String> topProfessions = [];
    for (var profession in allprofession) {
      if (profession['score'] == maxScore) {
        topProfessions.add(checkProffesionTitle(profession['title']));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "result1".tr(),
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 20,
        ),
        ...topProfessions.map(
          (e) => Text(
            e,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  String checkProffesionTitle(title) {
    String result = '';

    switch (title) {
      case 'konobar':
        result = 'Konobar';
        break;
      case 'kuhar':
        result = 'Kuhar';
        break;
      case 'tes':
        result = 'Pomoćni kuhar i slastičar';
        break;
      case 'slasticar':
        result = 'Slastičar';
        break;
      case 'htt':
        result = 'Hotelijersko-turistički tehničar';
        break;
      case 'thk':
        result = 'Turističko-hotelijerski komercijalist';
        break;
      case 'kt':
        result = 'Kuharski tehničar';
        break;
      default:
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          resultPhrase,
          SizedBox(
            height: size.height * 0.1,
          ),
          InkWell(
            onTap: () {
              resetQuiz();
            },
            child: Container(
              width: size.width * 0.5,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(193, 2, 48, 1),
              ),
              child: Center(
                child: Text(
                  'resetQuiz'.tr(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
