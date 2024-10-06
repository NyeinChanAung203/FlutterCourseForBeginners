import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderDemo extends StatelessWidget {
  const StreamProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamProvider"),
      ),
      body: StreamProvider(
          create: (context) => getStreamData(),
          initialData: 0,
          builder: (context, child) =>
              Text("Hello Streaming ,  ${context.watch<int>()}")),
    );
  }

  Stream<int> getStreamData() async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }
}
