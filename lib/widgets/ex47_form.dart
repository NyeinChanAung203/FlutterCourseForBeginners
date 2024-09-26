import 'dart:developer';

import 'package:flutter/material.dart';

class Ex47Form extends StatefulWidget {
  const Ex47Form({super.key});

  @override
  State<Ex47Form> createState() => _Ex47FormState();
}

class _Ex47FormState extends State<Ex47Form> {
  late final TextEditingController controller;
  late final TextEditingController controller2;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextFormField With Form"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            canPop: false,
            // onPopInvoked: (value) {
            //   log("canPop $value");
            // },
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
                  onFieldSubmitted: (value) {
                    log('onFieldSubmitted $value');
                  },
                  onEditingComplete: () {
                    log("oneditingcomplte");
                  },
                  onSaved: (newValue) {
                    log('onsaved $newValue');
                  },
                ),
                TextFormField(
                  controller: controller2,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "TextField cannot be empty";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      debugPrint(controller.text);
                      debugPrint("submitted");
                    } else {
                      debugPrint("invalid form. Cannot submmit");
                    }
                  },
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
