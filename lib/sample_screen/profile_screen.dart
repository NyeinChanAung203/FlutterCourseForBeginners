import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build profilescreen");
    return Container(
      color: Colors.blueAccent,
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile Screen'),
        ],
      ),
    );
  }
}
