import 'package:flutter/material.dart';

class Ex2Text extends StatelessWidget {
  const Ex2Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Widget"),
      ),
      body: Center(
        child: Text(
          "Hello" * 12,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.purple,
            backgroundColor: Colors.lightGreenAccent,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 4,
            wordSpacing: 20,
            height: 2.2,
            decoration: TextDecoration.underline,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
