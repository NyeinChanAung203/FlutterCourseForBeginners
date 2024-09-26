import 'package:flutter/material.dart';

import 'package:flutter_course/widgets/ex29_part.dart';

class Ex29StatefulLifecycle extends StatefulWidget {
  const Ex29StatefulLifecycle({super.key});

  @override
  State<Ex29StatefulLifecycle> createState() => _Ex29StatefulLifecycleState();
}

class _Ex29StatefulLifecycleState extends State<Ex29StatefulLifecycle> {
  int number = 1;

  @override
  void initState() {
    super.initState();
    debugPrint("initState $number");
  }

  @override
  void didChangeDependencies() {
    debugPrint("didChangeDependencies $number");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build $number");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful widget"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberText(number: number),
            const SizedBox(height: 16),
            Text("Parent number: $number"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  number++;
                });

                debugPrint(number.toString());
              },
              child: const Text("Increase"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NumberText(number: 99),
                  ),
                );
              },
              child: const Text("Go To Detail"),
            )
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant Ex29StatefulLifecycle oldWidget) {
    debugPrint("didUpdateWidget $number");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    debugPrint("deactivate $number");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("dispose $number");
    super.dispose();
  }
}
