import 'package:flutter/material.dart';

class ScProvider extends ChangeNotifier {
  int _totalAmount = 0;

  int get totalAmount {
    return _totalAmount;
  }

  void changeTotalAmount(int newAmount) {
    _totalAmount = _totalAmount + newAmount;
    notifyListeners();
  }
}
