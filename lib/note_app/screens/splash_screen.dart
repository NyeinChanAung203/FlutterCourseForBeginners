import 'package:flutter/material.dart';
import 'package:flutter_course/note_app/screens/note_list_screen.dart';

class NoteSplashScreen extends StatefulWidget {
  const NoteSplashScreen({super.key});

  @override
  State<NoteSplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<NoteSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const NoteListScreen(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/notes.png",
              width: 80,
            ),
            const SizedBox(height: 8),
            const Text("Notes ")
          ],
        ),
      ),
    );
  }
}
