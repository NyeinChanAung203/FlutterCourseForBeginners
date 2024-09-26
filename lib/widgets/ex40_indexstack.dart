import 'package:flutter/material.dart';
import 'package:flutter_course/sample_screen/home_screen.dart';
import 'package:flutter_course/sample_screen/notification_screen.dart';
import 'package:flutter_course/sample_screen/profile_screen.dart';

class Ex40Indexstack extends StatefulWidget {
  const Ex40Indexstack({super.key});

  @override
  State<Ex40Indexstack> createState() => _Ex40IndexstackState();
}

class _Ex40IndexstackState extends State<Ex40Indexstack> {
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
        title: const Text("IndexedStack"),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
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
