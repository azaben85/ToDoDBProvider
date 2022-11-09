import 'package:flutter/material.dart';

class ControlAppProvider extends ChangeNotifier {
  bool acceptConditions = false;
  bool isDarkMode = false;
  setAcceptConditions(bool accept) {
    acceptConditions = accept;
    notifyListeners();
  }

  changeDarkMode(bool isDarkMode) {
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }
}
