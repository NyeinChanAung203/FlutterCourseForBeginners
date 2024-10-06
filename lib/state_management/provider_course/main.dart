import 'package:flutter/material.dart';
import 'package:flutter_course/state_management/provider_course/counter_app.dart';
import 'package:flutter_course/state_management/provider_course/counter_provider.dart';
import 'package:flutter_course/state_management/provider_course/counter_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProviderCourse());
}

class ProviderCourse extends StatelessWidget {
  const ProviderCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider Course",
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider()),
          Provider(create: (context) => "StringProviderValue"),
          ProxyProvider<CounterProvider, CounterService>(
            update: (context, counterProvider, previous) =>
                CounterService(counterProvider.count),
          ),
        ],
        child: const CounterApp(),
      ),
    );
  }
}
