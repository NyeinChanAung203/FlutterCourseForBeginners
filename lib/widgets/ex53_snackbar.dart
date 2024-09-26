import 'package:flutter/material.dart';

class Ex53Snackbar extends StatelessWidget {
  const Ex53Snackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                showCloseIcon: true,
                content: const Text("Success"),
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(
                  label: 'ok',
                  onPressed: () {},
                ),
              ),
            );
          },
          child: const Text("Show SnackBar"),
        ),
      ),
    );
  }
}
