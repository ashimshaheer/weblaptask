import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsProvider extends ChangeNotifier {
  bool isbooklater = false;

  TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  DateTime? _selectedDate;

  TimeOfDay _selectedTime = TimeOfDay.now();

  DateTime? get selectedDate => _selectedDate;

  TimeOfDay get selectedTime => _selectedTime;

  void isbooklaterFnc({required bool value}) {
    isbooklater = value;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && _selectedDate != null) {
      updateSelectedDate(picked);
      dateController.text = DateFormat('yyyy-MM-dd').format(picked); // Format the selected date
      notifyListeners();
    }
    notifyListeners();
  }

  void updateSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void updateSelectedTime(TimeOfDay time) {
    _selectedTime = time;
    notifyListeners();
  }
}
