import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/ex62_streambuilder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Course',
      debugShowCheckedModeBanner: false,
      home: Ex62Streambuilder(),
    );
  }
}
