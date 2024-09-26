import 'package:flutter/material.dart';

class Ex55Page extends StatefulWidget {
  const Ex55Page({super.key});

  @override
  State<Ex55Page> createState() => _Ex55PageState();
}

class _Ex55PageState extends State<Ex55Page> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: currentIndex == 0 ? Colors.red : Colors.grey,
                radius: 8,
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                backgroundColor: currentIndex == 1 ? Colors.red : Colors.grey,
                radius: 8,
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                backgroundColor: currentIndex == 2 ? Colors.red : Colors.grey,
                radius: 8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
