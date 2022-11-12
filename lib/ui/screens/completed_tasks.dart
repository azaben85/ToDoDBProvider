import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provide/providers/todo_provider.dart';
import 'package:todo_db_provide/ui/widgets/task_widget.dart';

class CompletedTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoClassProvider>(
      builder: (context, provider, child) {
        List tasks = provider.completedTasks;
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskWidget(taskModel: tasks[index]);
          },
        );
      },
    );
  }
}
