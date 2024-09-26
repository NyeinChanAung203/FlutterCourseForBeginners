import 'package:flutter/material.dart';

class Ex42Circularprogressindicator extends StatelessWidget {
  const Ex42Circularprogressindicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CircularProgressIndicator"),
      ),
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey.shade300,
          color: Colors.green,
          strokeAlign: 2,
          strokeCap: StrokeCap.round,
          strokeWidth: 20,
        ),
      ),
    );
  }
}
