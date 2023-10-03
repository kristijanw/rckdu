import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rckdu/questions.dart';
import 'package:rckdu/screens/quiz/quiz.dart';
import 'package:rckdu/screens/quiz/result.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, Object>> _questions = [];
  final allprofession = allProfession;
  var _questionIndex = 0;
  var _totalScore = 0;

  void dodijeliBodove(odabranaZanimanja, svaZanimanja) {
    for (String odabranoZanimanje in odabranaZanimanja) {
      for (int i = 0; i < svaZanimanja.length; i++) {
        if (svaZanimanja[i]['title'] == odabranoZanimanje) {
          svaZanimanja[i]['score']++;
        }
      }
    }
  }

  void resetirajBodove(svaZanimanja) {
    for (int i = 0; i < svaZanimanja.length; i++) {
      svaZanimanja[i]['score'] = 0;
    }
  }

  void _answerQuestion(int score, profession) {
    // _totalScore += score;

    if (profession != null) {
      dodijeliBodove(profession, allprofession);
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      log('We have more questions!');
    } else {
      log('No more questions!');
    }
  }

  void _resetQuiz() {
    resetirajBodove(allprofession);
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize _questions based on the locale
    if (context.locale.toString() == 'hr_HR') {
      setState(() {
        _questions = allQuestions;
      });
    } else {
      setState(() {
        _questions = allQuestionsEng;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double consumedData = _questionIndex / _questions.length;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/navigation'),
        ),
        title: Text(
          'quizTitle'.tr(),
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.03,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        backgroundColor: const Color(0xffC10230),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: consumedData,
            ),
            builder: (context, value, _) =>
                LinearProgressIndicator(value: value),
          ),
          Padding(
            padding: EdgeInsets.all(size.height * 0.03),
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(
                    resultScore: _totalScore,
                    resetQuiz: _resetQuiz,
                    allprofession: allProfession,
                  ),
          ),
        ],
      ),
    );
  }
}
