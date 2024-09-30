import 'package:flutter/material.dart';

class NumberText extends StatefulWidget {
  const NumberText({super.key, required this.number});

  // Widget configuration
  final int number;

  @override
  State<NumberText> createState() => _NumberTextState();
}

class _NumberTextState extends State<NumberText> {
  int localNumberState = 1;

  @override
  void initState() {
    super.initState();
    debugPrint("initState NumberText ${widget.number} $localNumberState");
  }

  @override
  void didChangeDependencies() {
    debugPrint(
        "didChangeDependencies NumberText ${widget.number} $localNumberState");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build NumberText ${widget.number} $localNumberState");
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          children: [
            Text("Constructor Number: ${widget.number}"),
            Text("Local Number : $localNumberState"),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  localNumberState++;
                });
              },
              child: const Text("Increase Local Number"),
            )
          ],
        ));
  }

  @override
  void didUpdateWidget(covariant NumberText oldWidget) {
    debugPrint("didUpdateWidget NumberText ${widget.number} $localNumberState");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    debugPrint("deactivate NumberText ${widget.number} $localNumberState");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("dispose NumberText ${widget.number} $localNumberState");
    super.dispose();
  }
}
