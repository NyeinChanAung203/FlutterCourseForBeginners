import 'package:flutter/material.dart';

class Ex10Column extends StatelessWidget {
  const Ex10Column({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout (Column)"),
      ),
      body: Container(
        width: 400,
        // height: 500,
        color: Colors.yellowAccent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
