import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'StartScreen';
  List<String> selectedanswer = [];

  void getanswer(String answer) {
    selectedanswer.add(answer);
    if (selectedanswer.length == questions.length) {
      setState(() {
        activeScreen = 'ResultScreen';
      });
    }
  }

  swichScreen() {
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  restartQuiz() {
    selectedanswer = [];
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = StartScreen(startQuiz: swichScreen);
    if (activeScreen == 'ResultScreen') {
      screenwidget = Result(
        chosenanswer: selectedanswer,
        restartquiz: restartQuiz,
      );
    } else if (activeScreen == 'QuestionScreen') {
      screenwidget = QuestionScreen(onpressedanswer: getanswer);
    }
    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.green, Colors.deepOrange],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topLeft)),
          child: screenwidget),
    ));
  }
}
