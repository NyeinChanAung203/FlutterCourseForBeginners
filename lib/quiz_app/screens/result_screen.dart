import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/provider/question_provider.dart';
import 'package:flutter_course/quiz_app/provider/quiz_provider.dart';
import 'package:flutter_course/quiz_app/screens/question_screen.dart';
import 'package:flutter_course/quiz_app/screens/widgets/quiz_button.dart';
import 'package:flutter_course/quiz_app/theme/colors.dart';
import 'package:provider/provider.dart';

import '../repositories/quiz_repository.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final int score = context.read<QuizProvider>().totalScore;
    final int questionCount = context.read<QuizProvider>().answers.length;
    final questionType = context.read<QuestionProvider>().questionType;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: cyanColor,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total correct answers',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '$questionCount out of 10 Questions',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cyanColor,
                  ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 48,
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  Text(
                    "Your final score is",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 24),
                  CircleAvatar(
                    backgroundColor: orangeColor,
                    radius: 80,
                    child: Text(
                      score.toString(),
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            QuizButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (context) => QuizProvider(),
                      ),
                      ChangeNotifierProvider(
                        create: (context) => QuestionProvider(
                          questionType: questionType,
                          quizRepository: QuizRepository(),
                        ),
                      ),
                    ],
                    child: const QuizQuestionScreen(),
                  ),
                  fullscreenDialog: true,
                ));
              },
              text: 'Try Again',
              icon: const Icon(
                Icons.refresh,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
