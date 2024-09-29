import 'package:flutter/material.dart';
import 'package:flutter_course/ex3_movieUI/data.dart';
import 'package:flutter_course/ex3_movieUI/widgets.dart';

class SuggestionSection extends StatefulWidget {
  const SuggestionSection({super.key});

  @override
  State<SuggestionSection> createState() => _SuggestionSectionState();
}

class _SuggestionSectionState extends State<SuggestionSection> {
  late final PageController _pageController;
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.65,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TitleWidget(title: 'May You Like'),
        SizedBox(
          height: 120,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            controller: _pageController,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(right: 28),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    suggestions[index].imgUrl,
                  ),
                ),
              ),
            ),
            itemCount: suggestions.length,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            suggestions.length,
            (index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 4,
                backgroundColor:
                    index == currentIndex ? Colors.red : Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
