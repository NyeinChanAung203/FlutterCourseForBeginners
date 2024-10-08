import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_course/quiz_app/model/question.dart';

class QuizRepository {
  static const _url = 'assets/quiz/quiz.json';

  Future<List<Question>> easyQuestions() async {
    final jsonData = await rootBundle.loadString(_url);
    final response = jsonDecode(jsonData) as Map<String, dynamic>;
    final List<dynamic> questions = response['easyQuestions'];
    final easyQuestions = questions.map((q) => Question.fromMap(q)).toList();
    easyQuestions.shuffle();

    return easyQuestions.take(10).toList();
  }

  Future<List<Question>> mediumQuestions() async {
    final jsonData = await rootBundle.loadString(_url);
    final response = jsonDecode(jsonData) as Map<String, dynamic>;
    final List<dynamic> questions = response['mediumQuestions'];
    final mediumQuestions = questions.map((q) => Question.fromMap(q)).toList();
    mediumQuestions.shuffle();

    return mediumQuestions.take(10).toList();
  }

  Future<List<Question>> hardQuestions() async {
    final jsonData = await rootBundle.loadString(_url);
    final response = jsonDecode(jsonData) as Map<String, dynamic>;
    final List<dynamic> questions = response['hardQuestions'];
    final hardQuestions = questions.map((q) => Question.fromMap(q)).toList();
    hardQuestions.shuffle();

    return hardQuestions.take(10).toList();
  }
}
