import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/ex2_text.dart';

// BuildContext:
// Each widget in Flutter has a BuildContext,
// which holds information about the widget's location
// in the widget tree.
// It access to things higher up in the widget hierarchy,
// like the Navigator, Theme, etc.

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
        home: Scaffold(
          body: Center(
            child: Builder(builder: (ctx) {
              return TextButton(
                onPressed: () {
                  Navigator.of(ctx).push(
                    MaterialPageRoute(
                      builder: (_) => const Ex2Text(),
                    ),
                  );
                },
                child: const Text(
                  "Go To Next Page",
                ),
              );
            }),
          ),
        ));
  }
}




// MyApp(BuildContext context)
// |_ MaterialApp(BuildContext)[Navigator]
//    |_ Scaffold(BuildContext)
//      |_ Center(BuildContext)
//        |_ TextButton(BuildContext)
//          |_ Navigator.of(context).push()



// MyApp(BuildContext context)
// |_ MaterialApp(BuildContext)[Navigator]
//   |_ Scaffold(BuildContext)
//     |_ Center(BuildContext)
//       |_ Builder(BuildContext ctx)
//         |_ TextButton(BuildContext)
//           |_ Navigator.of(ctx).push()