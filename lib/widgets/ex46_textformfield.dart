import 'package:flutter/material.dart';

class Ex46Textformfield extends StatefulWidget {
  const Ex46Textformfield({super.key});

  @override
  State<Ex46Textformfield> createState() => _Ex46TextformfieldState();
}

class _Ex46TextformfieldState extends State<Ex46Textformfield> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextFormField"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "TextField cannot be empty";
                  } else if (value != 'Kyaw Kyaw') {
                    return "This text is not 'Kyaw Kyaw'";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint(controller.text);
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
