import 'dart:developer';

import 'package:flutter/material.dart';

class Ex16Gesturedector extends StatelessWidget {
  const Ex16Gesturedector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GestureDector"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            log("clicked");
          },
          onDoubleTap: () {
            log("double tap");
          },
          child: const Text("Click Me"),
        ),
      ),
    );
  }
}
