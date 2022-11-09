import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provide/providers/accept_provider.dart';
import 'package:todo_db_provide/ui/screens/todo_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<ControlAppProvider>(
        create: (context) {
          return ControlAppProvider();
        },
        child: InitApp(),
      ),
    );
  }
}

class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ControlAppProvider>(context).isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'ToDo APP',
      home: TodoMainScreen(),
    );
  }
}
