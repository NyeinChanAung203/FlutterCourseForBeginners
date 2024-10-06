import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_course/state_management/provider_course/counter_provider.dart';
import 'package:flutter_course/state_management/provider_course/counter_service.dart';
import 'package:flutter_course/state_management/provider_course/future_provider_demo.dart';
import 'package:flutter_course/state_management/provider_course/stream_provider_demo.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("counter app build");
    // final count = context.watch<CounterProvider>().count;
    final stringValue = context.read<String>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App - Provider"),
        actions: const [
          // Badge.count(
          //   count: context.watch<CounterService>().countServiceData,
          //   child: const Icon(
          //     Icons.shopping_cart,
          //   ),
          // ),
          SizedBox(width: 20)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<CounterProvider>(
              builder: (context, CounterProvider value, child) {
            return Column(
              children: [
                Text("Count: ${value.count} \n $stringValue"),
              ],
            );
          }),
          Selector<CounterProvider, int>(
            selector: (context, cp) => cp.number,
            builder: (context, int number, child) => Text("Number: $number"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const FutureProviderDemo(),
              ));
            },
            child: const Text("To Future"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const StreamProviderDemo(),
              ));
            },
            child: const Text("To Stream"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterProvider>().increaseNumber();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<CounterProvider>().increase,
        child: const Icon(Icons.add),
      ),
    );
  }
}
