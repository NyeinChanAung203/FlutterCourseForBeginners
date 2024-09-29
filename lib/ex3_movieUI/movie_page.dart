import 'package:flutter/material.dart';
import 'package:flutter_course/ex3_movieUI/data.dart';
import 'package:flutter_course/ex3_movieUI/movie_section.dart';
import 'package:flutter_course/ex3_movieUI/suggestion_section.dart';
import 'package:flutter_course/ex3_movieUI/trending_section.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    const blackColor = Color(0xff202124);
    return Scaffold(
      backgroundColor: blackColor,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: blackColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Pocket TV",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TrendingSection(),
            MovieSection(
              title: 'New Movies',
              movies: movies,
            ),
            const SuggestionSection(),
            MovieSection(
              title: 'TV Shows',
              movies: tvs,
            ),
          ],
        ),
      ),
    );
  }
}
