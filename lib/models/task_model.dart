// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:todo_db_provide/data_repository/db_helper.dart';

class TaskModel {
  int? id;
  String? title;
  bool? isComplete;

  TaskModel({this.id, this.title, this.isComplete});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DBHelper.dbHelper.idColumn: id,
      DBHelper.dbHelper.titleColumn: title,
      DBHelper.dbHelper.isCompleteColumn: (isComplete! ? 1 : 0),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      isComplete: map['isComplete'] == 1 ? true : false,
    );
  }
}
