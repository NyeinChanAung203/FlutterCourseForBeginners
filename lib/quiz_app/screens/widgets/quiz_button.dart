import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/theme/colors.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.style,
  });

  final VoidCallback onPressed;
  final String text;
  final ButtonStyle? style;
  final Icon? icon;

  factory QuizButton.small({
    required VoidCallback onPressed,
    required String text,
  }) {
    return QuizButton(
      onPressed: onPressed,
      text: text,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(100, 40),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [icon!, const SizedBox(width: 8), Text(text)],
            )
          : Text(text),
    );
  }
}
