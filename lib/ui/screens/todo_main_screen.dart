import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provide/providers/todo_provider.dart';
import 'package:todo_db_provide/ui/screens/all_tasks.dart';
import 'package:todo_db_provide/ui/screens/completed_tasks.dart';
import 'package:todo_db_provide/ui/screens/incompleted_tasks.dart';
import 'package:todo_db_provide/ui/screens/insert_task.dart';

class TodoMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo Main Screen'),
          actions: [
            InkWell(
              child: Icon(Icons.add),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return NewTaskScreen();
                  },
                ));
              },
            ),
            IconButton(onPressed: () {
              Provider.of<ToDoClassProvider>(context, listen: false)
                  .changeDarkMode(
                      !Provider.of<ToDoClassProvider>(context, listen: false)
                          .isDarkMode);
            }, icon: Consumer<ToDoClassProvider>(
                builder: (context, provider, child) {
              return Icon(provider.isDarkMode == false
                  ? Icons.dark_mode
                  : Icons.light_mode);
            }))
          ],
          bottom: const TabBar(tabs: [
            Tab(text: 'All Tasks'),
            Tab(text: 'Completed Tasks'),
            Tab(text: 'Incompleted Tasks')
          ]),
        ),
        body: Consumer<ToDoClassProvider>(
          builder: (context, controlAppProvider, child) {
            //controlAppProvider.getAllTasks();
            return TabBarView(children: [
              AllTasksScreen(),
              CompletedTasksScreen(),
              InCompletedTasksScreen(),
            ]);
          },
        ),
      ),
    );
  }
}
