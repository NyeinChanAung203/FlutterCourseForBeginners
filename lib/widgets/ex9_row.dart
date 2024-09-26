import 'package:flutter/material.dart';

class Ex9Row extends StatelessWidget {
  const Ex9Row({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout (Row)"),
      ),
      body: Container(
        height: 400,
        color: Colors.yellowAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
