import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback resetQuiz;
  final int resultScore;

  const Result({
    Key? key,
    required this.resetQuiz,
    required this.resultScore,
  }) : super(key: key);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 41) {
      resultText = 'Ti si odličan!';
    } else if (resultScore >= 31) {
      resultText = 'Prilično simpatično!';
    } else if (resultScore >= 21) {
      resultText = 'Trebaš više raditi!';
    } else if (resultScore >= 1) {
      resultText = 'Treba se potruditi!';
    } else {
      resultText = 'Ovo je loš rezultat!';
    }
    return resultText;
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
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$resultScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //
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
