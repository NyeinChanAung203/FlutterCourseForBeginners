import 'package:flutter/material.dart';

class Ex11Stack extends StatelessWidget {
  const Ex11Stack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout (Stack)"),
      ),
      body: Container(
        width: 300,
        height: 300,
        color: Colors.yellow,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
