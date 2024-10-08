import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/provider/question_provider.dart';
import 'package:flutter_course/quiz_app/provider/quiz_provider.dart';
import 'package:flutter_course/quiz_app/screens/result_screen.dart';
import 'package:flutter_course/quiz_app/screens/widgets/question_option_widget.dart';
import 'package:flutter_course/quiz_app/screens/widgets/quiz_button.dart';
import 'package:provider/provider.dart';

class QuizQuestionScreen extends StatefulWidget {
  const QuizQuestionScreen({
    super.key,
  });

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    Future.microtask(() async {
      if (mounted) {
        await context.read<QuestionProvider>().loadQuestion();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<QuestionProvider>(
        builder: (context, questionProvider, child) => PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: questionProvider.questions.length,
          itemBuilder: (context, index) => QuestionOptionsWidget(
            number: index + 1,
            totalQuestion: questionProvider.questions.length,
            question: questionProvider.questions[index],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (context, page, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: page > 0
                    ? QuizButton.small(
                        onPressed: () {
                          if (page > 0) {
                            page -= 1;
                            _currentPage.value = page;
                            _pageController.animateToPage(page,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          }
                        },
                        text: 'Previous')
                    : const SizedBox(),
              ),
              page < 9
                  ? QuizButton.small(
                      onPressed: () {
                        if (page < 9) {
                          page += 1;
                          _currentPage.value = page;
                          _pageController.animateToPage(page,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        }
                      },
                      text: 'Next')
                  : QuizButton.small(
                      onPressed: () {
                        context.read<QuizProvider>().checkAnswer(context);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider<QuizProvider>.value(
                                value: context.read<QuizProvider>(),
                              ),
                              ChangeNotifierProvider.value(
                                  value: context.read<QuestionProvider>()),
                            ],
                            child: const QuizResultScreen(),
                          ),
                        ));
                      },
                      text: 'Done',
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
