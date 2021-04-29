import 'package:crm_task_feature/Constants.dart';
import 'package:crm_task_feature/providers.dart/tasks.dart';
import 'package:crm_task_feature/screens/add_new_task.dart';
import 'package:crm_task_feature/screens/all_tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Tasks())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorPalette.primaryColor,
        ),
        routes: {
          '/': (context) => AllTasksScreen(),
          AddTask.routeName: (context) => AddTask(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AllTasksScreen(),
    );
  }
}
