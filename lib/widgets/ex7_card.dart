import 'package:flutter/material.dart';

class Ex7Card extends StatelessWidget {
  const Ex7Card({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Card(
          color: Colors.blue,
          elevation: 10,
          child: Text(
            "FlutterVerse",
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}
