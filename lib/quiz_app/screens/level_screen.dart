import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/constants/question_type.dart';
import 'package:flutter_course/quiz_app/provider/question_provider.dart';
import 'package:flutter_course/quiz_app/provider/quiz_provider.dart';
import 'package:flutter_course/quiz_app/repositories/quiz_repository.dart';
import 'package:flutter_course/quiz_app/screens/question_screen.dart';
import 'package:flutter_course/quiz_app/screens/widgets/quiz_button.dart';
import 'package:flutter_course/quiz_app/theme/colors.dart';
import 'package:provider/provider.dart';

class QuizLevelScreen extends StatelessWidget {
  const QuizLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: secondaryBackgroundColor,
            padding: const EdgeInsets.only(top: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Choose Your Level",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontFamily: 'Montserrat',
                        color: cyanColor,
                      ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 16),
                  color: secondaryBackgroundColor,
                  child: Image.asset(
                    'images/quiz/wave.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 56),
                ...List.generate(
                  QuestionType.values.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: QuizButton(
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                create: (context) => QuizProvider(),
                              ),
                              ChangeNotifierProvider(
                                create: (context) => QuestionProvider(
                                  questionType: QuestionType.values[index],
                                  quizRepository: QuizRepository(),
                                ),
                              ),
                            ],
                            child: const QuizQuestionScreen(),
                          ),
                          fullscreenDialog: true,
                        ));
                      },
                      text: QuestionType.values[index].name.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
