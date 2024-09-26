import 'package:flutter/material.dart';
import 'package:flutter_course/sample_screen/home_screen.dart';
import 'package:flutter_course/sample_screen/notification_screen.dart';
import 'package:flutter_course/sample_screen/profile_screen.dart';

class Ex37NavigationBar extends StatefulWidget {
  const Ex37NavigationBar({super.key});

  @override
  State<Ex37NavigationBar> createState() => _Ex37NavigationBarState();
}

class _Ex37NavigationBarState extends State<Ex37NavigationBar> {
  int currentIndex = 0;

  final pages = [
    const HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NavigationBar"),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        height: 60,
        indicatorColor: Colors.purple,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
