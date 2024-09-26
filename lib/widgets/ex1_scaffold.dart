import 'package:flutter/material.dart';

class Ex1Scaffold extends StatelessWidget {
  const Ex1Scaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text("Leading"),
        title: const Text("App bar title"),
      ),
      body: const Text("Hello World"),
    );
  }
}
