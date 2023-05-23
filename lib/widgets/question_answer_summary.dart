import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class Answersummay extends StatelessWidget {
  Answersummay({super.key, required this.summarydata});
  List<Map<String, Object>> summarydata;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(children: [
          ...summarydata.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                    child: Text(((data['index'] as int) + 1).toString())),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        data['questions'].toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(),
                      Text("Correct answer is ${data['correctanswer']}"),
                      Text("User answer is ${data['useranswer']}")
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            );
          }).toList(),
        ]),
      ),
    );
  }
}
