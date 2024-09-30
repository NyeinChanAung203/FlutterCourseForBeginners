import 'package:flutter/material.dart';

class Ex24Gridtile extends StatelessWidget {
  const Ex24Gridtile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridTile"),
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) => GridTile(
          // header: const Icon(
          //   Icons.star,
          //   color: Colors.white,
          // ),
          footer: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            color: Colors.white60,
            child: Text("Juice $index"),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "images/juice.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
