import 'package:flutter/material.dart';
import './answers.dart';
import './questions.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function answerFunc;

  Quiz(
      {@required this.answerFunc,
      @required this.questionIndex,
      this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Questions(questions[questionIndex]['questionText']),
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
        return Answers(() => answerFunc(answer['score']), answer['text']);
      }).toList()
    ]);
  }
}
