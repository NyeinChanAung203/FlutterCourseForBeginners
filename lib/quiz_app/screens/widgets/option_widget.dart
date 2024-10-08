import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.answer,
    required this.number,
    required this.onTap,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final String number;
  final String answer;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      splashColor: cyanColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? cyanColor : Colors.transparent,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: primaryColor,
              child: Text(
                "$number.",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                answer,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isSelected ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
