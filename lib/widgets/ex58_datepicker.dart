import 'package:flutter/material.dart';

class Ex58Datepicker extends StatelessWidget {
  const Ex58Datepicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date picker"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            //final result =
            await showDatePicker(
              context: context,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              helpText: "Help Me",
              cancelText: 'Cancel me',
              confirmText: 'Confirm me',
              initialEntryMode: DatePickerEntryMode.calendar,
              // initialDatePickerMode: DatePickerMode.year,
              // initialDate: DateTime(2024, 7, 1),
              currentDate: DateTime(2024, 8, 1),
              builder: (context, child) => Theme(
                data: ThemeData.dark(),
                child: child!,
              ),
            );
            //print('result $result');
          },
          child: const Text("Date Picker"),
        ),
      ),
    );
  }
}
