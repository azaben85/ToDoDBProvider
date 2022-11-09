import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provide/providers/accept_provider.dart';
import 'package:todo_db_provide/providers/todo_provider.dart';

class TodoMainScreen extends StatelessWidget {
  const TodoMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Main Screen'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ControlAppProvider>(context, listen: false)
                    .changeDarkMode(
                        !Provider.of<ControlAppProvider>(context, listen: false)
                            .isDarkMode);
              },
              icon: Icon(
                  Provider.of<ControlAppProvider>(context).isDarkMode == false
                      ? Icons.dark_mode
                      : Icons.light_mode))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text('Accept Condition: '),
              Checkbox(
                  value:
                      Provider.of<ControlAppProvider>(context).acceptConditions,
                  onChanged: (value) {
                    Provider.of<ControlAppProvider>(context, listen: false)
                        .setAcceptConditions(value ?? false);
                  }),
            ],
          ),
          if (Provider.of<ControlAppProvider>(context, listen: false)
              .acceptConditions)
            const Text(
              'You Accepted The conditions',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          if (Provider.of<ControlAppProvider>(context, listen: false)
              .acceptConditions)
            ElevatedButton(onPressed: () {}, child: const Text('Next')),
          const Text(
            'testt',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          // Text(
          //   Provider.of<ToDoClassProvider>(context).name.toString(),
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(fontSize: 30),
          // ),
          // ElevatedButton(
          //     onPressed: () {
          //       Provider.of<ToDoClassProvider>(context, listen: false)
          //           .changeName('Ahmad Zaben');
          //     },
          //     child: const Text('Change Name Attribute'))
        ],
      ),
    );
  }
}
