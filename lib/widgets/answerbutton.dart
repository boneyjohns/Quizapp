import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton({super.key, required this.answer, required this.ontap});

  final String answer;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.amberAccent,
          foregroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
