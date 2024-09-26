import 'package:flutter/material.dart';
import 'package:flutter_course/navigation/screen_a.dart';
import 'package:flutter_course/navigation/screen_b.dart';
import 'package:flutter_course/navigation/screen_c.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course',
      debugShowCheckedModeBanner: false,
      // home: const ScreenA(),
      // initialRoute: 'screenB',
      onGenerateInitialRoutes: (initialRoute) => [
        MaterialPageRoute(builder: (_) => const ScreenA()),
      ],
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'screenA':
            return MaterialPageRoute(builder: (_) => const ScreenA());
          case 'screenB':
            return MaterialPageRoute(
              builder: (_) => ScreenB(
                data: settings.arguments as String,
              ),
            );
          case 'screenC':
            return MaterialPageRoute(builder: (_) => const ScreenC());
          default:
            return MaterialPageRoute(builder: (_) => const ScreenA());
        }
      },
      // routes: {
      //   'screenA': (context) => const ScreenA(),
      // 'screenB': (context) => const ScreenB(data: '***'),
      //   'screenC': (context) => const ScreenC(),
      // },
    );
  }
}
