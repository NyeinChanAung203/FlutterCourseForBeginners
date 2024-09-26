import 'package:flutter/material.dart';
import 'package:flutter_course/sample_screen/home_screen.dart';
import 'package:flutter_course/sample_screen/notification_screen.dart';
import 'package:flutter_course/sample_screen/profile_screen.dart';

class Ex54Tab extends StatefulWidget {
  const Ex54Tab({super.key});

  @override
  State<Ex54Tab> createState() => _Ex54TabState();
}

class _Ex54TabState extends State<Ex54Tab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab & TabbarView"),
          bottom: const TabBar(tabs: [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Notification",
              icon: Icon(Icons.notifications),
            ),
            Tab(
              text: "Profile",
              icon: Icon(Icons.person),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          HomeScreen(),
          NotificationScreen(),
          ProfileScreen(),
        ]),
      ),
    );
  }
}
