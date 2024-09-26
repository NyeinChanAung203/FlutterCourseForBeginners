import 'dart:developer';

import 'package:flutter/material.dart';

class Ex17Inkwell extends StatelessWidget {
  const Ex17Inkwell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ink and InkWell"),
      ),
      body: Center(
        child: InkWell(
          splashColor: Colors.blue,
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            log("clicked");
          },
          onDoubleTap: () {
            log("double tap");
          },
          child: Ink(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.yellow,
              ),
              child: const Text("Click Me")),
        ),
      ),
    );
  }
}
