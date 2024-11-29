import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAndTimer extends StatefulWidget {
  const DateAndTimer({super.key});

  @override
  _DateAndTimerState createState() => _DateAndTimerState();
}

class _DateAndTimerState extends State<DateAndTimer> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select Booking Date'),
          const SizedBox(height: 8.0),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 8.0),
                Text(DateFormat('yyyy-MM-dd').format(_selectedDate)),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('Select Booking Time'),
          const SizedBox(height: 8.0),
          GestureDetector(
            onTap: () => _selectTime(context),
            child: Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 8.0),
                Text(_selectedTime.format(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
