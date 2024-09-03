import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isSelected = false;

  bool get isSelected => _isSelected;

  void toggleTheme() {
    _isSelected = !_isSelected;
    notifyListeners();
  }
}
