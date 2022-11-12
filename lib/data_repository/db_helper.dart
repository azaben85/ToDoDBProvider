import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_db_provide/models/task_model.dart';

class DBHelper {
  Database? database;

  DBHelper._();

  static DBHelper dbHelper = DBHelper._();

  String tableName = 'tasks';
  String idColumn = 'id';
  String titleColumn = 'title';
  String isCompleteColumn = 'isCompleted';

  Future<Database> createDatabaseConnection() async {
    Directory folderDirectory = await getApplicationDocumentsDirectory();
    String folderPath = folderDirectory.path;
    database = await openDatabase(
      '$folderPath/tasks.db',
      version: 2,
      onCreate: (db, version) {
        log('the db is created');
        db.execute(''' 
        CREATE TABLE $tableName (
          $idColumn INTEGER  primary key autoincrement , 
          $titleColumn varchar (50),
          $isCompleteColumn bool  
        )
      ''');
      },
      onOpen: (db) {
        log('COnnected');
      },
    );
    return database!;
  }

  connectIfClosed() async {
    if (database == null || !database!.isOpen) {
      await createDatabaseConnection();
    }
  }

  Future<int> insertNewTask(TaskModel taskModel) async {
    await connectIfClosed();
    // print();
    int rowNum = await database!.insert(tableName, {
      titleColumn: taskModel.title,
      isCompleteColumn: (taskModel.isComplete! ? 1 : 0)
    });
    return rowNum;
  }

  Future<List<TaskModel>> getAllTasks() async {
    List<Map<String, dynamic>> data = await database!.query(tableName);
    log(data.toString());
    return data.map((e) => TaskModel.fromMap(e)).toList();
  }

  updateNewTask(TaskModel taskModel) async {
    log(taskModel.isComplete!.toString());
    bool x = !taskModel.isComplete!;
    log(x.toString());
    int i = await database!.update(tableName, {isCompleteColumn: (x ? 1 : 0)},
        where: 'id=?', whereArgs: [taskModel.id]);

    log('i = $i');
  }

  Future<int> deleteNewTask(TaskModel taskModel) async {
    int count = await database!
        .delete(tableName, where: 'id=?', whereArgs: [taskModel.id]);
    return count;
  }
}
