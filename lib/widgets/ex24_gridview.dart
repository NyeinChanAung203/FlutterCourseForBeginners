import 'package:flutter/material.dart';

class Ex24Gridview extends StatelessWidget {
  const Ex24Gridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
      ),
      body: GridView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => const Card(
          child: Text("Hello"),
        ),
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        //   childAspectRatio: 16 / 9,
        //   crossAxisSpacing: 16,
        //   mainAxisSpacing: 24,
        // ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        ),
        // children: const [
        //   Card(
        //     child: Text("Hello"),
        //   ),
        //   Card(
        //     child: Text("Hello"),
        //   ),
        //   Card(
        //     child: Text("Hello"),
        //   ),
        // ],
      ),
    );
  }
}
