import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/screens/about_quiz_screen.dart';
import 'package:flutter_course/quiz_app/screens/level_screen.dart';
import 'package:flutter_course/quiz_app/screens/widgets/quiz_button.dart';
import 'package:flutter_course/quiz_app/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizHomeScreen extends StatelessWidget {
  const QuizHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: secondaryBackgroundColor,
              padding: const EdgeInsets.only(top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    "images/quiz/brain.svg",
                    height: 120,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Quizzles",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 60,
                    child: Image.asset(
                      'images/quiz/wave.png',
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            Text(
              "Let's play",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "Play now and Level up",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
                left: 28,
                right: 28,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  QuizButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const QuizLevelScreen(),
                      ));
                    },
                    text: "Play Now",
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const AboutQuizScreen(),
                      ));
                    },
                    child: const Text("About"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
