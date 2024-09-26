import 'package:flutter/material.dart';

class Ex35FloatingActionBtn extends StatelessWidget {
  const Ex35FloatingActionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floating action button"),
      ),
      body: const Center(
        child: Text("Hello"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: "Go To Messenger",
        onPressed: () {},
        icon: const Icon(
          Icons.message,
        ),
        label: const Text("To Messenger"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
