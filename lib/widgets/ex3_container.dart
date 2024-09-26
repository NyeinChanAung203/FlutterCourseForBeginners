import 'package:flutter/material.dart';

class Ex3Container extends StatelessWidget {
  const Ex3Container({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          height: 250,
          // color: Colors.red,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 200,
            height: 200,
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                // color: Colors.amber,
                // border: Border.all(
                //   color: Colors.black,
                //   width: 2,
                //   strokeAlign: 4,
                //   style: BorderStyle.solid,
                // ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 12,
                    offset: Offset(1, 1),
                    spreadRadius: 8,
                    blurStyle: BlurStyle.outer,
                  )
                ],
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red,
                      Colors.purple,
                    ])

                // shape: BoxShape.circle,
                ),
            child: const Text("FlutterVerse"),
          ),
        ),
      ),
    );
  }
}
