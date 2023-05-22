import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/answerbutton.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onpressedanswer});

  final void Function(String answer) onpressedanswer;
  @override
  State<QuestionScreen> createState() => _QuestionsState();
}

class _QuestionsState extends State<QuestionScreen> {
  var currentquestionindex = 0;
  changequestionindex(String answer) {
    widget.onpressedanswer(answer);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[currentquestionindex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            const SizedBox(
              height: 50,
            ),
            ...currentquestion.getShuffledanswer().map((answer) => Answerbutton(
                answer: answer,
                ontap: () {
                  changequestionindex(answer);
                  log(answer);
                }))
          ],
        ),
      ),
    );
  }
}
