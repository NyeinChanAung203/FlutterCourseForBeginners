import 'package:flutter/material.dart';

class Ex45Textfield extends StatefulWidget {
  const Ex45Textfield({super.key});

  @override
  State<Ex45Textfield> createState() => _Ex45TextfieldState();
}

class _Ex45TextfieldState extends State<Ex45Textfield> {
  late final FocusNode focusNode;
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                focusNode: focusNode,
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                  helperText: "Example. Kyaw Kyaw",
                  // errorText: "Name cannot empty",
                  isDense: true,
                  suffixIcon: const Icon(Icons.visibility),
                  // filled: true,
                  // fillColor: Colors.indigo,
                ),
                keyboardType: TextInputType.number,
                maxLength: 50,
                // obscureText: true,
                obscuringCharacter: "*",
                maxLines: null,
                onTapOutside: (v) {
                  focusNode.unfocus();
                },
                onChanged: (value) {
                  // print("value $value");
                },
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint(controller.text);
                  controller.clear();
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
