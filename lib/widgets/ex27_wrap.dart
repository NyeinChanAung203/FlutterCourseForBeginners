import 'package:flutter/material.dart';

class Ex27Wrap extends StatelessWidget {
  const Ex27Wrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wrap"),
      ),
      body: Center(
        child: Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("click"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("click"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("click"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("click"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("click"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("click"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("click"),
            ),
          ],
        ),
      ),
    );
  }
}
