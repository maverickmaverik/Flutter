import 'package:flutter/material.dart';
import '../widgets/addschedule.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({super.key});

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EngiTask'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: AddScheduleForm(
        selectedTime: selectedTime,
        selectedDate: selectedDate,
        onTimeChanged: (time) {
          setState(() {
            selectedTime = time;
          });
        },
        onDateChanged: (date) {
          setState(() {
            selectedDate = date;
          });
        },
      ),
    );
  }
}