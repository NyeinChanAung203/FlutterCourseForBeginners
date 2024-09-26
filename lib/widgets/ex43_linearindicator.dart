import 'package:flutter/material.dart';

class Ex43Linearindicator extends StatelessWidget {
  const Ex43Linearindicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LinearProgressIndicator"),
      ),
      body: Center(
        child: LinearProgressIndicator(
          // value: 0.9,
          backgroundColor: Colors.amber,
          color: Colors.red,
          borderRadius: BorderRadius.circular(50),
          minHeight: 20,
        ),
      ),
    );
  }
}
