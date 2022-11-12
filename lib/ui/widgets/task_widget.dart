// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_db_provide/models/task_model.dart';
import 'package:todo_db_provide/providers/todo_provider.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  TaskWidget({
    required this.taskModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: taskModel.isComplete! ? Colors.green : Colors.red),
      child: Row(
        children: [
          Text(taskModel.title!),
          Expanded(
            child: CheckboxListTile(
              value: taskModel.isComplete,
              onChanged: (value) {
                Provider.of<ToDoClassProvider>(context, listen: false)
                    .updateTask(taskModel);
              },
            ),
          ),
        ],
      ),
    );
  }
}
