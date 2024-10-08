import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/model/question.dart';
import 'package:flutter_course/quiz_app/provider/quiz_provider.dart';
import 'package:flutter_course/quiz_app/theme/colors.dart';
import 'package:provider/provider.dart';

import 'option_widget.dart';

class QuestionOptionsWidget extends StatelessWidget {
  const QuestionOptionsWidget({
    super.key,
    required this.number,
    required this.totalQuestion,
    required this.question,
  });

  final int number, totalQuestion;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "$number / $totalQuestion",
            style: const TextStyle(color: cyanColor),
          ),
          const SizedBox(height: 8),
          Text(
            question.question,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 36),
          ...List.generate(
            question.options.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Consumer<QuizProvider>(
                builder: (context, quizProvider, child) => OptionWidget(
                  answer: question.options[index],
                  number: (index + 1).toString(),
                  isSelected: quizProvider.isSelected(
                    number,
                    question.options[index],
                  ),
                  onTap: () {
                    quizProvider.addAnswer(
                      number,
                      question.options[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
