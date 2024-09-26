import 'package:flutter/material.dart';

class Ex5Cliprrect extends StatelessWidget {
  const Ex5Cliprrect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            // image: const DecorationImage(
            //   fit: BoxFit.cover,
            //   image: AssetImage(
            //     "images/juice.jpg",
            //   ),
            // ),
          ),
          width: 300,
          height: 240,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
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
