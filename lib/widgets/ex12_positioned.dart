import 'package:flutter/material.dart';

class Ex12Positoned extends StatelessWidget {
  const Ex12Positoned({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout (Stack -> Positioned)"),
      ),
      body: Container(
        width: 300,
        height: 300,
        color: Colors.yellow,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -50,
              bottom: 0,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
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
