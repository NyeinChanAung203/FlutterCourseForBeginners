import 'package:flutter/material.dart';

class Ex14ExerciseProfile extends StatelessWidget {
  const Ex14ExerciseProfile({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xff7278ea);
    const avatar =
        "https://th.bing.com/th/id/OIP.BG6R93SDonekNLrJrkiF4gHaHa?rs=1&pid=ImgDetMain";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Positioned(
                bottom: -40,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        image: DecorationImage(
                          image: NetworkImage(avatar),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -2,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 50),
          const Text(
            "FlutterVerse",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Text(
            'Flutter Developer',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ItemCard(
                    icon: Icon(
                      Icons.video_call_sharp,
                      color: color,
                    ),
                    text: "23.4",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ItemCard(
                    icon: Icon(
                      Icons.badge,
                      color: color,
                    ),
                    text: "7",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ItemCard(
                    icon: Icon(
                      Icons.star,
                      color: color,
                    ),
                    text: "3",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const MenuListTile(
            iconData: Icons.notifications,
            text: "Notification",
          ),
          const MenuListTile(
            iconData: Icons.settings,
            text: "Setting",
          ),
          const MenuListTile(
            iconData: Icons.medical_services_outlined,
            text: "Support Service",
          ),
          const MenuListTile(
            iconData: Icons.policy,
            text: "Privacy Policy",
          ),
          // Container(
          //   color: color,
          //   width: double.infinity,
          //   margin: const EdgeInsets.only(top: 40),
          //   height: 40,
          //   alignment: Alignment.center,
          //   child: const Text(
          //     "Sign Out",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    super.key,
    required this.iconData,
    required this.text,
  });

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xff7278ea);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.icon,
    required this.text,
  });

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Column(
          children: [
            icon,
            const SizedBox(height: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}
