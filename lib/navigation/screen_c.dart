import 'package:flutter/material.dart';
import 'package:flutter_course/navigation/screen_a.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen C"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Go Back To Screen B"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text("Go Back To Screen A"),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => const ScreenA(),
                  ),
                  (route) => false);
            },
            label: const Text("Push&RemoveUntil Screen A"),
          ),
        ],
      )),
    );
  }
}
