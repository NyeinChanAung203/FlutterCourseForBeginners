import 'package:flutter/material.dart';

class Ex49Checkbox extends StatefulWidget {
  const Ex49Checkbox({super.key});

  @override
  State<Ex49Checkbox> createState() => _Ex49CheckboxState();
}

class _Ex49CheckboxState extends State<Ex49Checkbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckBox"),
      ),
      body: Column(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (v) {
              setState(() {
                isChecked = v!;
              });
            },
          ),
          CheckboxListTile(
              value: isChecked,
              title: const Text("Title"),
              subtitle: const Text("subittile"),
              onChanged: (v) {
                setState(() {
                  isChecked = v!;
                });
              })
        ],
      ),
    );
  }
}
