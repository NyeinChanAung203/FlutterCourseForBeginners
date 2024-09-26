import 'dart:developer';

import 'package:flutter/material.dart';

class Ex22ListviewBuilder extends StatelessWidget {
  const Ex22ListviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Builder"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.blue,
            child: const Text("Hello World"),
          ),
          // ** small amount of item
          // Expanded(
          //   child: ListView(
          //       children: List.generate(
          //     5000,
          //     (index) => ItemText(text: index.toString()),
          //   )),
          // ),

          // ** large amount of item
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 5000,
          //     itemBuilder: (context, index) => ItemText(
          //       text: index.toString(),
          //     ),
          //   ),
          // ),

          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: 5000,
              itemBuilder: (context, index) => ItemText(
                text: index.toString(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemText extends StatelessWidget {
  const ItemText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    log("build $text");
    return Text("index $text");
  }
}
