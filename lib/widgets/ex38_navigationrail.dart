import 'package:flutter/material.dart';
import 'package:flutter_course/sample_screen/home_screen.dart';
import 'package:flutter_course/sample_screen/notification_screen.dart';
import 'package:flutter_course/sample_screen/profile_screen.dart';

class Ex38Navigationrail extends StatefulWidget {
  const Ex38Navigationrail({super.key});

  @override
  State<Ex38Navigationrail> createState() => _Ex38NavigationrailState();
}

class _Ex38NavigationrailState extends State<Ex38Navigationrail> {
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
        title: const Text("NavigationRail"),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            extended: false,
            leading: const Text("Leading"),
            trailing: const Text("Trailing"),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("Home"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.notifications),
                label: Text("Notification"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text("Profile"),
              ),
            ],
          ),
          Expanded(child: pages[currentIndex]),
        ],
      ),
    );
  }
}
