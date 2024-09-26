import 'package:flutter/material.dart';

class Ex6Icons extends StatelessWidget {
  const Ex6Icons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.two_wheeler,
          size: 50,
          color: Colors.red,
        ),
      ),
    );
  }
}
