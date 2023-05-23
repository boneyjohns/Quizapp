import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/question_answer_summary.dart';

class Result extends StatelessWidget {
  Result({super.key, required this.chosenanswer, required this.restartquiz});
  List<String> chosenanswer;
  final void Function() restartquiz;

  getsummarydata() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenanswer.length; i++) {
      summary.add({
        'index': i,
        'questions': questions[i].text,
        'correctanswer': questions[i].answer[0],
        'useranswer': chosenanswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getsummarydata();

    int totalquestions = questions.length;
    final correctanswer = summarydata.where(
      (element) {
        return element['correctanswer'] == element['useranswer'];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'you answered $correctanswer out of $totalquestions questions correctly',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            const SizedBox(
              height: 30,
            ),
            Answersummay(summarydata: summarydata),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  restartquiz();
                },
                child: const Text(
                  'Restart Quiz!',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ))
          ])),
    );
  }
}
