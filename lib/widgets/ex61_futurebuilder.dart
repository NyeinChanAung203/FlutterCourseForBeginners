import 'package:flutter/material.dart';

class Ex61Futurebuilder extends StatefulWidget {
  const Ex61Futurebuilder({super.key});

  @override
  State<Ex61Futurebuilder> createState() => _Ex61FuturebuilderState();
}

class _Ex61FuturebuilderState extends State<Ex61Futurebuilder> {
  Future<String> getDataFromInternet() async {
    await Future.delayed(const Duration(seconds: 2));
    // throw Exception("No internet");
    return Future.value("Data from internet");
  }

  late Future<String> getData;

  @override
  void initState() {
    super.initState();
    getData = getDataFromInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder"),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              initialData: "Init Data",
              future: getData,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    debugPrint("other state: ${snapshot.data}");
                    return const CircularProgressIndicator();

                  case ConnectionState.active:
                    debugPrint("active state: ${snapshot.data}");
                    return const Text("Activating....");
                  case ConnectionState.done:
                    debugPrint(
                        "done state: ${snapshot.data} ${snapshot.hasError} ${snapshot.error}");
                    if (snapshot.hasError) {
                      return const Text("Error");
                    }
                    return const Text("Done.");
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  getData = getDataFromInternet();
                });
              },
              child: const Text("REbuild"),
            ),
          ],
        ),
      ),
    );
  }
}
