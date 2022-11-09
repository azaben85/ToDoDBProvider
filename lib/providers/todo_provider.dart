import 'package:flutter/material.dart';

class ToDoClassProvider extends ChangeNotifier {
  String name = 'Omar';
  int age = 50;
  bool isMale = true;
  changeName(String newName) {
    name = newName;
    notifyListeners();
  }
}
