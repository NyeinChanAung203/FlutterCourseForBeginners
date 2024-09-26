import 'package:flutter/material.dart';
import 'package:flutter_course/navigation/screen_c.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    // final argument = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen B"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Data: $data"),
          const Text("Data from argument: --"),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop("Data From ScreenB");
            },
            label: const Text("Go Back To Screen A"),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ScreenC(),
                ),
              );
            },
            label: const Text("Go To Screen C"),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const ScreenC(),
                ),
              );
            },
            label: const Text("Replace Screen C"),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => const ScreenC(),
                  ),
                  (route) => route.isFirst);
            },
            label: const Text("Push&RemoveUntil Screen C"),
          ),
        ],
      )),
    );
  }
}
