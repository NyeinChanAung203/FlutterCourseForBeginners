import 'package:flutter/material.dart';
import 'package:flutter_course/sample_screen/home_screen.dart';
import 'package:flutter_course/sample_screen/notification_screen.dart';
import 'package:flutter_course/sample_screen/profile_screen.dart';

class Ex39Drawer extends StatefulWidget {
  const Ex39Drawer({super.key});

  @override
  State<Ex39Drawer> createState() => _Ex39DrawerState();
}

class _Ex39DrawerState extends State<Ex39Drawer> {
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
        title: const Text("Drawer"),
      ),
      body: pages[currentIndex],
      // drawerScrimColor: Colors.red,
      onDrawerChanged: (open) {
        debugPrint('is open $open');
      },
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("Kyaw Kyaw"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                setState(() {
                  currentIndex = 0;
                  Navigator.of(context).pop();
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notificaiton"),
              onTap: () {
                setState(() {
                  currentIndex = 1;
                  Navigator.of(context).pop();
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                setState(() {
                  currentIndex = 2;
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
