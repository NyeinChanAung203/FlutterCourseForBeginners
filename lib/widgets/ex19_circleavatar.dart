import 'package:flutter/material.dart';

class Ex19Circleavatar extends StatelessWidget {
  const Ex19Circleavatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CircleAvatar"),
      ),
      body: const Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 56,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              // backgroundImage: AssetImage("images/juice.jpg"),
              foregroundImage: AssetImage("images/juice.jpg"),
              child: Text("J"),
            ),
          ),
        ],
      ),
    );
  }
}
