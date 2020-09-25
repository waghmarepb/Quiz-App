import 'package:flutter/material.dart';

import './question.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionBank;
  final int questionIndex;
  final Function answerChoosen;
  Quiz({
    @required this.questionBank,
    @required this.questionIndex,
    @required this.answerChoosen,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionBank[questionIndex]['questionText']),
        ...(questionBank[questionIndex]['options'] as List).map((answer) {
          final index =
              (questionBank[questionIndex]['options'] as List).indexOf(answer);
          return Answers(() => answerChoosen(index), answer);
        }).toList(),
      ],
    );
  }
}
