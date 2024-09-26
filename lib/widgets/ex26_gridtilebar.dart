import 'package:flutter/material.dart';

class Ex26Gridtilebar extends StatelessWidget {
  const Ex26Gridtilebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridTile bar"),
      ),
      body: Center(
        child: GridTile(
          header: GridTileBar(
            backgroundColor: Colors.blue,
            title: const Text("FlutterVerse"),
            subtitle: const Text("12 min ago"),
            leading: const CircleAvatar(
              child: Text("F"),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.blue,
            title: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                const Text('12'),
              ],
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "images/juice.jpg",
              fit: BoxFit.cover,
              height: 240,
            ),
          ),
        ),
      ),
    );
  }
}
