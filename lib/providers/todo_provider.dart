import 'package:flutter/material.dart';
import 'package:todo_db_provide/data_repository/db_helper.dart';
import 'package:todo_db_provide/models/task_model.dart';

class ToDoClassProvider extends ChangeNotifier {
  ToDoClassProvider() {
    getAllTasks();
  }
  List<TaskModel> allTasks = [];
  List<TaskModel> completedTasks = [];
  List<TaskModel> inCompletedTasks = [];
  TextEditingController textController = TextEditingController();
  getAllTasks() async {
    allTasks = await DBHelper.dbHelper.getAllTasks();
    completedTasks = allTasks.where((element) => element.isComplete!).toList();
    inCompletedTasks =
        allTasks.where((element) => !element.isComplete!).toList();
    notifyListeners();
  }

  insertNewTask() async {
    TaskModel taskModel =
        TaskModel(title: textController.text, isComplete: false);
    await DBHelper.dbHelper.insertNewTask(taskModel);
    getAllTasks();
  }

  updateTask(TaskModel taskModel) async {
    print(' DDDD ${taskModel.isComplete}');

    await DBHelper.dbHelper.updateNewTask(taskModel);
    getAllTasks();
  }

  deletTask(TaskModel taskModel) async {
    await DBHelper.dbHelper.deleteNewTask(taskModel);
    getAllTasks();
  }

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
