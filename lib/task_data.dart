import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  List<String> tasks = [];

  void addTask(String newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
