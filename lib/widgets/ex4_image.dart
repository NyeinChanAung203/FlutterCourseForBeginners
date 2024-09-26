import 'package:flutter/material.dart';

class Ex4Image extends StatelessWidget {
  const Ex4Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "images/juice.jpg",
                ),
              )),
          width: 300,
          height: 240,
          child: const Text(
            "Juice",
            style: TextStyle(color: Colors.white),
          ),
        ),
        // child: Image.network(
        //     "https://th.bing.com/th/id/OIP.Q6R49EFCR62g4QtakGPRFAHaHZ?w=500&h=499&rs=1&pid=ImgDetMain")
      ),
    );
  }
}
