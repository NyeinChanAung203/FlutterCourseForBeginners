import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderDemo extends StatelessWidget {
  const FutureProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureProvider"),
      ),
      body: FutureProvider(
          create: (context) => getData(),
          initialData: FutureData('..'),
          builder: (context, child) =>
              Text("Hello future,${context.watch<FutureData>().data}")),
    );
  }

  Future<FutureData> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(FutureData('future_data'));
  }
}

class FutureData {
  final String data;
  FutureData(this.data);
}
