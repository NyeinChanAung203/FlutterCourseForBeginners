import 'package:flutter/material.dart';

class Ex13ExpanedFlexible extends StatelessWidget {
  const Ex13ExpanedFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanded vs Flexible"),
      ),
      body: Container(
        height: 400,
        color: Colors.amberAccent,
        child: Row(
          children: [
            Expanded(
              child: Container(
                // width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
