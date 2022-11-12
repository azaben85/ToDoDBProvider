import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provide/data_repository/db_helper.dart';
import 'package:todo_db_provide/providers/todo_provider.dart';
import 'package:todo_db_provide/ui/screens/todo_main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.dbHelper.createDatabaseConnection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDoClassProvider>(
      create: (context) {
        return ToDoClassProvider();
      },
      child: InitApp(),
    );
  }
}

class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ToDoClassProvider>(context).isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'ToDo APP',
      home: TodoMainScreen(),
    );
  }
}
