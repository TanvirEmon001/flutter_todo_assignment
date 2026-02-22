import 'package:flutter/material.dart';
import 'package:todo_management/features/todo/presentation/screens/add_task_screen.dart';
import 'package:todo_management/features/todo/presentation/screens/lets_start_screen.dart';
import 'package:todo_management/features/todo/presentation/screens/todays_task_screen.dart';

import 'app_theme.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        AddTaskScreen.route : (context) => const AddTaskScreen(),
        TodaysTaskScreen.route : (context) => const TodaysTaskScreen(),
        LetsStartScreen.route : (context) => const LetsStartScreen()
      },
      initialRoute: LetsStartScreen.route,
    );
  }
}
