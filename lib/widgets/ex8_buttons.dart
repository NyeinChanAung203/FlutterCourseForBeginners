import 'package:flutter/material.dart';

class Ex8Buttons extends StatelessWidget {
  const Ex8Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: OutlinedButton.icon(
        onPressed: () {},
        label: const Text("Home"),
        icon: const Icon(Icons.home),
      )
          //     OutlinedButton(
          //   onPressed: () {},
          //   child: const Text("submit"),
          // )

          //     IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.home),
          // )

          //     TextButton(
          //   onPressed: () {},
          //   child: const Text("Submit"),
          // )

          // ElevatedButton(
          //   onPressed: () {
          //     print("clicked");
          //   },
          //   style: const ButtonStyle(
          //     backgroundColor: WidgetStatePropertyAll(Colors.red),
          //     foregroundColor: WidgetStatePropertyAll(Colors.white),
          //     elevation: WidgetStatePropertyAll(10),
          //   ),
          //   child: const Text("Submit"),
          // ),
          ),
    );
  }
}
