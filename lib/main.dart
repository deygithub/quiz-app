import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';

import './quiz.dart';

void main() {
  runApp(const MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Blue", "score": 2},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1}
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 4},
        {"text": "Snake", "score": 3},
        {"text": "Elephant", "score": 6},
        {"text": "Lion", "score": 7},
      ],
    },
    {
      "questionText": "What's your favorite snack?",
      "answers": [
        {"Text": "Donut", "score": 1},
        {"text": "Burger", "score": 1},
        {"text": "Fries", "score": 1},
        {"text": "Noodles", "score": 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(
      () {
        _questionIndex = _questionIndex + 1;
      },
    );
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print("NO More Questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _restartQuiz),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
