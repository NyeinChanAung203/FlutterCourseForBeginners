import 'package:flutter/material.dart';

class Ex44Slider extends StatefulWidget {
  const Ex44Slider({super.key});

  @override
  State<Ex44Slider> createState() => _Ex44SliderState();
}

class _Ex44SliderState extends State<Ex44Slider> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider"),
      ),
      body: Center(
        child: Slider(
          value: sliderValue,
          // secondaryTrackValue: sliderValue + 0.2,
          activeColor: Colors.red,
          inactiveColor: Colors.blue,
          thumbColor: Colors.lightGreen,
          max: 100,
          min: 0,
          onChanged: (v) {
            setState(() {
              sliderValue = v;
            });
          },
        ),
      ),
    );
  }
}
