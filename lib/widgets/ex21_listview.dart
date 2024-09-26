import 'package:flutter/material.dart';

class Ex21Listview extends StatelessWidget {
  const Ex21Listview({super.key});

  @override
  Widget build(BuildContext context) {
    final itemList = List.generate(
      50,
      (index) => Text("Hello $index"),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.blue,
            child: const Text("Hello World"),
          ),
          Expanded(
            child: ListView(
              children: itemList,
            ),
          ),
        ],
      ),
    );
  }
}
