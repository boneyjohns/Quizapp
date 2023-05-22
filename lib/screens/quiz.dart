import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
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
  final List<String> selectedanswer = [];

  void getanswer(String answer) {
    selectedanswer.add(answer);
    if (selectedanswer.length == questions.length) {
      setState(() {
        activeScreen = 'StartScreen';
      });
    }
  }

  swichScreen() {
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green, Colors.deepOrange],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topLeft)),
            child: activeScreen == 'StartScreen'
                ? StartScreen(
                    startQuiz: swichScreen,
                  )
                : QuestionScreen(onpressedanswer: getanswer)),
      ),
    );
  }
}
