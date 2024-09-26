import 'package:flutter/material.dart';

class Ex20Singlechildscroll extends StatelessWidget {
  const Ex20Singlechildscroll({super.key});

  @override
  Widget build(BuildContext context) {
    final itemList = List.generate(
      20,
      (index) => ListTile(
        title: Text("Hello $index"),
        tileColor: Colors.blue,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Child Scroll View"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16),
        reverse: false,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: itemList,
        ),
      ),
    );
  }
}
