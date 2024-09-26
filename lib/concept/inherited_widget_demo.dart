import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int number = 0;
  void increase() {
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build Mainwidget");
    return NumberProvider(
      number: number,
      onPressed: increase,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Inherited Widget"),
          actions: const [
            ShoppingCardWidget(),
          ],
        ),
        body: const BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("build bodyWidget");
    return const Center(
      child: Column(
        children: [
          NoNeedNumberWidget(),
          NeedNumberWidget(),
        ],
      ),
    );
  }
}

class NoNeedNumberWidget extends StatelessWidget {
  const NoNeedNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build NoNeedNumberWidget");
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
      color: Colors.amber,
      child: const Text("No need number in this widget."),
    );
  }
}

class NeedNumberWidget extends StatefulWidget {
  const NeedNumberWidget({
    super.key,
  });

  @override
  State<NeedNumberWidget> createState() => _NeedNumberWidgetState();
}

class _NeedNumberWidgetState extends State<NeedNumberWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies is called");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build NeedNumberWidget");
    final number = NumberProvider.of(context)!.number;
    return Column(
      children: [
        Text("Number: $number"),
        ElevatedButton(
          onPressed: NumberProvider.of(context)!.onPressed,
          child: const Text("+"),
        )
      ],
    );
  }
}

class ShoppingCardWidget extends StatelessWidget {
  const ShoppingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build shoppingCartWidget");
    final number = NumberProvider.of(context)!.number;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(Icons.shopping_cart),
        Positioned(
          top: -8,
          left: -10,
          child: CircleAvatar(
            radius: 10,
            child: Text(number.toString()),
          ),
        )
      ],
    );
  }
}

class NumberProvider extends InheritedWidget {
  const NumberProvider(
      {super.key,
      required this.number,
      required this.onPressed,
      required this.child})
      : super(child: child);

  final int number;
  final VoidCallback onPressed;

  @override
  // ignore: overridden_fields
  final Widget child;

  static NumberProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NumberProvider>();
  }

  @override
  bool updateShouldNotify(NumberProvider oldWidget) {
    // old number != new number ? update : nothing
    return oldWidget.number != number;
  }
}
