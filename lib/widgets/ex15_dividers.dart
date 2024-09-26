import 'package:flutter/material.dart';

class Ex15Dividers extends StatelessWidget {
  const Ex15Dividers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dividers"),
      ),
      body: const Column(
        children: [
          Text("hello"),
          Divider(
            height: 4,
            thickness: 2,
            color: Colors.blue,
            indent: 23,
            endIndent: 23,
          ),
          Text("hello"),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Text("hello"),
                VerticalDivider(),
                Text("hello"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
