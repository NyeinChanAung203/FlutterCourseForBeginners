import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/constants/app_constants.dart';
import 'package:flutter_svg/svg.dart';

class AboutQuizScreen extends StatelessWidget {
  const AboutQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              SvgPicture.asset(
                "images/quiz/brain.svg",
                height: 120,
              ),
              const SizedBox(height: 40),
              const Text(
                aboutApp,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
