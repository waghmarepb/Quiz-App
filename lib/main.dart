import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(DemoApp002());

class DemoApp002 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DemoApp002State();
  }
}

class _DemoApp002State extends State<DemoApp002> {
  int _questionIndex = 0;

  var questionBank = [
    {
      "questionText": " AngularJS supports which kind of data binding. ",
      "type": "Multiple-Response",
      "correctOptionIndex": [0, 1],
      "_id": "598e9256cc88456d444e7c12",
      "options": ["one", "two", "three", "four"]
    },
    {
      "questionText": " AngularJS is based on the which pattern. ",
      "correctOptionIndex": 1,
      "_id": "598e9256cc88456d444e7c11",
      "options": [" VMC", "MVC", "MCV", "CVM"]
    },
    {
      "questionText":
          "There is a controller which takes single parameter. We call it  parameter",
      "correctOptionIndex": 2,
      "_id": "598e9256cc88456d444e7c10",
      "options": ["param", "control", "scope", "scont"]
    },
    {
      "questionText":
          "Which directive is used if you want to add or remove HTML elements from the DOM based on data in the model. ",
      "correctOptionIndex": 0,
      "_id": "598e9256cc88456d444e7c0f",
      "options": ["ng-switch", "ng-model ", "ng-Disabled", "ng-Cloak"]
    },
    {
      "questionText": "Event binding can be defined.?",
      "correctOptionIndex": 0,
      "_id": "598e9256cc88456d444e7c0e",
      "options": [
        "by wrapping the event in parenthesis",
        "by wrapping the event in square brackets",
        "by wrapping the event in curly brackets",
        "by prefixing it with on dollar"
      ]
    }
  ];

  var _resultScore = 0;

  void _answerChoosen(int index) {
    if (this.questionBank[_questionIndex]['type'] == 'Multiple-Response') {
      var aBool =
          (this.questionBank[_questionIndex]['correctOptionIndex'] as List)
                  .indexOf(index) !=
              -1;
      if (aBool) {
        _resultScore += 1;
      }
    } else {
      if (index == this.questionBank[_questionIndex]['correctOptionIndex']) {
        _resultScore += 1;
      }
    }

    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _resultScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Demo App'),
        ),
        body: _questionIndex < questionBank.length
            ? Quiz(
                questionBank: this.questionBank,
                questionIndex: this._questionIndex,
                answerChoosen: this._answerChoosen,
              )
            : Result(_resultScore, _resetQuiz),
      ),
    );
  }
}
