import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provide/providers/todo_provider.dart';
import 'package:todo_db_provide/ui/widgets/task_widget.dart';

class AllTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoClassProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.allTasks.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  log(provider.allTasks[index].isComplete.toString());
                },
                child: TaskWidget(taskModel: provider.allTasks[index]));
          },
        );
      },
    );
  }
}
