import 'package:flutter/material.dart';

class Ex50Swtich extends StatefulWidget {
  const Ex50Swtich({super.key});

  @override
  State<Ex50Swtich> createState() => _Ex50SwtichState();
}

class _Ex50SwtichState extends State<Ex50Swtich> {
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swtich"),
      ),
      body: Center(
        child: Column(
          children: [
            Switch(
                value: isOpen,
                activeColor: Colors.red,
                // activeTrackColor: Colors.green,
                activeThumbImage: const AssetImage('images/juice.jpg'),
                thumbColor: const WidgetStatePropertyAll(Colors.blue),
                onChanged: (v) {
                  setState(() {
                    isOpen = v;
                  });
                }),
            SwitchListTile(
                title: const Text("Title"),
                subtitle: const Text("Subtitle"),
                value: isOpen,
                onChanged: (v) {
                  setState(() {
                    isOpen = v;
                  });
                })
          ],
        ),
      ),
    );
  }
}
