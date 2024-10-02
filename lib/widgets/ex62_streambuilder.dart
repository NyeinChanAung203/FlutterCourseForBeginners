import 'package:flutter/material.dart';

class Ex62Streambuilder extends StatefulWidget {
  const Ex62Streambuilder({super.key});

  @override
  State<Ex62Streambuilder> createState() => _Ex62StreambuilderState();
}

class _Ex62StreambuilderState extends State<Ex62Streambuilder> {
  Stream<int> getStreamData() async* {
    for (var i = 1; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (i / 5 == 1) {
        throw Exception("no internet");
      }
      yield i;
    }
  }

  late Stream<int> getStream;

  @override
  void initState() {
    super.initState();
    getStream = getStreamData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Builder"),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder(
              initialData: 0,
              stream: getStream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    debugPrint("other state: ${snapshot.data}");
                    return const CircularProgressIndicator();
                  case ConnectionState.active:
                    debugPrint(
                        "active state: ${snapshot.data} ${snapshot.hasData} ${snapshot.error}");
                    return Text("Active ${snapshot.data}");
                  case ConnectionState.done:
                    debugPrint(
                        "done state: ${snapshot.data}  ${snapshot.hasData} ${snapshot.error}");
                    if (snapshot.hasError) {
                      return const Text("Error");
                    }
                    return Text("Done. ${snapshot.data}");
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  getStream = getStreamData();
                });
              },
              child: const Text("Rebuild"),
            )
          ],
        ),
      ),
    );
  }
}
