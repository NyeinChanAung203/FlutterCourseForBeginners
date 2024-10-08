import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/constants/app_constants.dart';
import 'package:flutter_course/quiz_app/provider/question_provider.dart';
import 'package:provider/provider.dart';

class QuizProvider with ChangeNotifier {
  final Map<int, String> _answers = {};
  Map<int, String> get answers => _answers;

  int _totalScore = 0;
  int get totalScore => _totalScore;

  void addAnswer(int questionNumber, String answer) {
    if (_answers.containsKey(questionNumber)) {
      // update
      _answers.update(questionNumber, (_) => answer);
    } else {
      // add
      _answers.addEntries([MapEntry(questionNumber, answer)]);
    }
    notifyListeners();
    debugPrint(_answers.toString());
  }

  bool isSelected(int questionNumber, String option) {
    if (_answers.containsKey(questionNumber)) {
      return _answers[questionNumber] == option;
    }
    return false;
  }

  void checkAnswer(BuildContext context) {
    _totalScore = 0;
    final questions = context.read<QuestionProvider>().questions;
    for (var i = 0; i < questions.length; i++) {
      final correctAnswer = questions[i].answer;
      if (_answers.containsKey(i + 1)) {
        if (_answers[i + 1] == correctAnswer) {
          _totalScore += score;
        }
      }
    }
  }
}
