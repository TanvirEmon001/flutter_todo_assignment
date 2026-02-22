import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_management/features/todo/presentation/screens/add_task_screen.dart';
import 'package:todo_management/features/todo/presentation/screens/lets_start_screen.dart';
import 'package:todo_management/features/todo/presentation/screens/todays_task_screen.dart';

import '../presentation/bloc/theme/theme_bloc.dart';
import 'app_theme.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {

          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<ThemeBloc>().add(LoadThemeEvent());
          });

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            routes: {
              AddTaskScreen.route: (context) => const AddTaskScreen(),
              TodaysTaskScreen.route: (context) => const TodaysTaskScreen(),
              LetsStartScreen.route: (context) => const LetsStartScreen()
            },
            initialRoute: LetsStartScreen.route,
          );
        },
      ),
    );
  }
}
