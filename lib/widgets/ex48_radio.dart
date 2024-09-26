import 'package:flutter/material.dart';

class Ex48Radio extends StatefulWidget {
  const Ex48Radio({super.key});

  @override
  State<Ex48Radio> createState() => _Ex48RadioState();
}

class _Ex48RadioState extends State<Ex48Radio> {
  String selectedValue = 'valueOne';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  value: 'valueOne',
                  groupValue: selectedValue,
                  onChanged: (v) {
                    setState(() {
                      selectedValue = v!;
                      debugPrint(selectedValue);
                    });
                  },
                ),
                const Text("Value One")
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'valueTwo',
                  groupValue: selectedValue,
                  onChanged: (v) {
                    setState(() {
                      selectedValue = v!;
                      debugPrint(selectedValue);
                    });
                  },
                ),
                const Text("Value Two")
              ],
            ),
            RadioListTile(
              value: 'valueOne',
              groupValue: selectedValue,
              title: const Text("Value One"),
              subtitle: const Text("subtitle"),
              onChanged: (v) {
                setState(() {
                  selectedValue = v!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
