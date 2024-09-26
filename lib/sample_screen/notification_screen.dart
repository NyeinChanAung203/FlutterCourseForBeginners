import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build notificationScreen");
    return Container(
      color: Colors.greenAccent,
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Notification Screen'),
        ],
      ),
    );
  }
}
