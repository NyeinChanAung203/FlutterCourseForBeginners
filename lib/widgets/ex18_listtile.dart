import 'package:flutter/material.dart';

class Ex18Listtile extends StatelessWidget {
  const Ex18Listtile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListTile"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Text("F"),
            ),
            title: Text("Kyaw Kyaw " * 2),
            subtitle: const Text("09123123321"),
            trailing: const Icon(Icons.phone),
            isThreeLine: false,
            dense: true,
            tileColor: Colors.pink,
            onTap: () {
              // print("clicked");
            },
          )
        ],
      ),
    );
  }
}
