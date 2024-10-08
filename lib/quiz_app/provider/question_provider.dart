import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/constants/question_type.dart';
import 'package:flutter_course/quiz_app/model/question.dart';
import 'package:flutter_course/quiz_app/repositories/quiz_repository.dart';

class QuestionProvider with ChangeNotifier {
  final QuestionType questionType;
  final QuizRepository quizRepository;

  QuestionProvider({
    required this.questionType,
    required this.quizRepository,
  });

  late List<Question> _questions = [];
  List<Question> get questions => _questions;

  Future<void> loadQuestion() async {
    switch (questionType) {
      case QuestionType.easy:
        final data = await quizRepository.easyQuestions();
        _questions = data;

        break;
      case QuestionType.medium:
        final data = await quizRepository.mediumQuestions();
        _questions = data;

        break;
      case QuestionType.hard:
        final data = await quizRepository.hardQuestions();
        _questions = data;

        break;
    }
    notifyListeners();
  }
}
