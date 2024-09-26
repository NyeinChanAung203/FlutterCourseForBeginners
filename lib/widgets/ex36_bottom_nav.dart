import 'package:flutter/material.dart';
import 'package:flutter_course/sample_screen/home_screen.dart';
import 'package:flutter_course/sample_screen/notification_screen.dart';
import 'package:flutter_course/sample_screen/profile_screen.dart';

class Ex36BottomNav extends StatefulWidget {
  const Ex36BottomNav({super.key});

  @override
  State<Ex36BottomNav> createState() => _Ex36BottomNavState();
}

class _Ex36BottomNavState extends State<Ex36BottomNav> {
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
        title: const Text("BottomNavigationBar"),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.purple.shade100,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            // print('currentIndex $currentIndex');
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
