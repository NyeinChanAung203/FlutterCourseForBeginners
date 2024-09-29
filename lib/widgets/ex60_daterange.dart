import 'package:flutter/material.dart';

class Ex60DateRangePicker extends StatelessWidget {
  const Ex60DateRangePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DateRange picker"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // final result =
            await showDateRangePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2030),
              keyboardType: TextInputType.number,
              fieldStartHintText: 'Start Hint',
              fieldEndHintText: 'End hint',
              fieldEndLabelText: 'End Label',
              fieldStartLabelText: 'Start label',
            );
            // print('result ${result?.start}');
          },
          child: const Text("Date Range Picker"),
        ),
      ),
    );
  }
}
