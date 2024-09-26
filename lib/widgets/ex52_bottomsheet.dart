import 'package:flutter/material.dart';

class Ex52Bottomsheet extends StatelessWidget {
  const Ex52Bottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomSheet"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: const Text("Hello,"),
              ),
            );
          },
          child: const Text("Show bottomsheet"),
        ),
      ),
    );
  }
}
