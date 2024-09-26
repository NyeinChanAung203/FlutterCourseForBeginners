import 'package:flutter/material.dart';

class Ex51Dialog extends StatelessWidget {
  const Ex51Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const AboutDialog(
                      applicationIcon: FlutterLogo(),
                      applicationName: "FlutterCourse",
                      applicationVersion: '1.0.0',
                      children: [
                        Text("Hello "),
                        Text("Hello "),
                        Text("Hello "),
                      ],
                    )

                // AlertDialog(
                //       icon: const Icon(Icons.home),
                //       title: const Text("Title"),
                //       content: const Text("Subtitle"),
                //       actions: [
                //         TextButton(
                //           onPressed: () {
                //             Navigator.of(context).pop(false);
                //           },
                //           child: const Text('Cancel'),
                //         ),
                //         TextButton(
                //           onPressed: () {
                //             Navigator.of(context).pop(true);
                //           },
                //           child: const Text('Ok'),
                //         ),
                //       ],
                //     )

                // const SimpleDialog(
                //       title: Text("title"),
                //       children: [
                //         Text("Hello "),
                //         Text("Hello "),
                //         Text("Hello "),
                //       ],
                //     )

                //  const Dialog.fullscreen(
                //       child: Text("Hello"),
                //     )

                //  const Dialog(
                //   child: Padding(
                //     padding: EdgeInsets.all(16.0),
                //     child: Text("Hello"),
                //   ),
                // ),

                );

            debugPrint(result.toString());
          },
          child: const Text("Open"),
        ),
      ),
    );
  }
}
