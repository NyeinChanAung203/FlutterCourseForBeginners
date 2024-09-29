import 'package:flutter/material.dart';

class Ex59Timepicker extends StatelessWidget {
  const Ex59Timepicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time picker"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // final result =
            await showTimePicker(
              context: context,
              initialTime: const TimeOfDay(
                hour: 22,
                minute: 8,
              ),
              initialEntryMode: TimePickerEntryMode.input,
            );
            // print('result $result');
          },
          child: const Text("Time Picker"),
        ),
      ),
    );
  }
}
