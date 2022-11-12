import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provide/providers/todo_provider.dart';

class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Consumer<ToDoClassProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              TextFormField(
                controller: provider.textController,
                decoration: const InputDecoration(label: Text('Task Title')),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await provider.insertNewTask();
                    Navigator.of(context).pop();
                  },
                  child: Text('Create Task'))
            ],
          );
        },
      ),
    );
  }
}
