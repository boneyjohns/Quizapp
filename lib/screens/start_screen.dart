import 'dart:developer';

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              'lib/asset/quiz-logo.png',
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Lets play some quiz ',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
              log(startQuiz.toString());
            },
            icon: const Icon(Icons.arrow_right, color: Colors.black),
            label:
                const Text('Start Now', style: TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
