import 'package:flutter/material.dart';
import 'package:flutter_course/navigation/screen_b.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen A"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Go To Screen B"),
              onPressed: () async {
                const dataFromScreenA = "dataFromScreenA";
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ScreenB(
                            data: dataFromScreenA,
                          ),
                      settings: const RouteSettings(
                        name: 'ScreenA',
                        arguments: dataFromScreenA,
                      )),
                );
                debugPrint("result: $result");
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Go To Screen B using namedRoute"),
              onPressed: () async {
                const dataFromScreenA = "dataFromScreenA";
                final result = await Navigator.of(context).pushNamed(
                  'screenB',
                  arguments: dataFromScreenA,
                );
                debugPrint("result: $result");
              },
            ),
          ],
        ),
      ),
    );
  }
}
