import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  bool isbooklater = false;

  void isbooklaterFnc({required bool value}) {
    isbooklater = value;
    notifyListeners();
  }
}
