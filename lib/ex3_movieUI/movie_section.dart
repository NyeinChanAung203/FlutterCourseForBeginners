import 'package:flutter/material.dart';
import 'package:flutter_course/ex3_movieUI/movie.dart';
import 'package:flutter_course/ex3_movieUI/widgets.dart';

class MovieSection extends StatelessWidget {
  const MovieSection({
    super.key,
    required this.movies,
    required this.title,
  });

  final String title;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleWidget(title: title),
        SizedBox(
          height: 160,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 120,
                  margin: const EdgeInsets.only(right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        movies[index].imgUrl,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    movies[index].name,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
