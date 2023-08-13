import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectMenuOpt = 0;

  int get selectMenuOpt => _selectMenuOpt;

  set selectMenuOpt(int index) {
    _selectMenuOpt = index;
    notifyListeners();
  }
}
