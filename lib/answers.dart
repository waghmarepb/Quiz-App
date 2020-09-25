import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Function answerChoosen;
  final String answerText;
  Answers(this.answerChoosen, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.all(10),
      child: RaisedButton(
        color: Colors.red[200],
        child: Text(answerText),
        onPressed: () => answerChoosen(),
      ),
    );
  }
}
