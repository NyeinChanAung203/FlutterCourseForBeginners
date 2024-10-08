import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/screens/home_screen.dart';
import 'package:flutter_course/quiz_app/theme/quiz_theme.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz",
      debugShowCheckedModeBanner: false,
      home: const QuizHomeScreen(),
      theme: QuizTheme.theme,
    );
  }
}
