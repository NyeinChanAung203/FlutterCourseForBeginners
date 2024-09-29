import 'package:flutter/material.dart';
import 'package:flutter_course/ex3_movieUI/movie_page.dart';

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
      home: MoviePage(),
    );
  }
}
