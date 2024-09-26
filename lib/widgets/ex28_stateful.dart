/*

Stateless Widgets
- Definition: 
    These widgets do not change their state once they are built.
    They are immutable.
- Usage: 
    Ideal for static content that doesn’t need to update dynamically.


Stateful Widgets
- Definition:
    These widgets can change their state during the app’s lifecycle.
    They are mutable.
- Usage: 
    Suitable for dynamic content that needs to update based on user interactions 
    or other factors.
*/

import 'package:flutter/material.dart';

class Ex28Stateful extends StatefulWidget {
  const Ex28Stateful({super.key});

  @override
  State<Ex28Stateful> createState() => _Ex28StatefulState();
}

class _Ex28StatefulState extends State<Ex28Stateful> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    // print("build $number");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful widget"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(number.toString()),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  number++;
                });

                // print(number);
              },
              child: const Text("Increase"),
            )
          ],
        ),
      ),
    );
  }
}
