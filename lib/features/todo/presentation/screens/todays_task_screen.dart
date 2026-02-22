import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/network_caller.dart';
import '../../../../core/presentation/bloc/theme/theme_bloc.dart';
import '../../../../core/presentation/bloc/todo/todo_bloc.dart';
import '../../../../core/utils/assets_path.dart';
import '../../data/repositories/todo_repository.dart';
import '../../widgets/dynamic_date_strip.dart';
import '../../widgets/empty_tasks_widget.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/task_card_widget.dart';
import '../../widgets/task_tab_bar.dart';
import 'add_task_screen.dart';


class TodaysTaskScreen extends StatefulWidget {
  static const String route = "today-tasks";

  const TodaysTaskScreen({super.key});

  @override
  State<TodaysTaskScreen> createState() => _TodaysTaskScreenState();
}

class _TodaysTaskScreenState extends State<TodaysTaskScreen> {
  // Track selected date from DynamicDateStrip
  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFloatingActionButton(),
      body: BlocProvider(
        // Create TodoBloc with dependencies
        create: (context) {
          final networkCaller = NetworkCaller(
            onUnauthorize: () {
              // Handle unauthorized (e.g., navigate to login)
              _showUnauthorizedDialog(context);
            },
            headers: {
              'Content-Type': 'application/json',
              // Add your auth token here if needed
              // 'Authorization': 'Bearer YOUR_TOKEN',
            },
          );

          return TodoBloc(
            todoRepository: TodoRepository(networkCaller: networkCaller),
          )..add(FetchTodaysTasksEvent(date: _selectedDate));
        },
        child: Column(
          children: [
            // Dynamic Date Strip with callback
            const DynamicDateStrip(),
            const TaskTabBar(),

            // Tasks List with BLoC
            Expanded(
              child: BlocConsumer<TodoBloc, TodoState>(
                listener: (context, state) {
                  // Show errors via SnackBar
                  if (state is TodoError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  // Handle different states
                  if (state is TodoInitial) {
                    return const Center(
                      child: Text('Ready to load tasks...'),
                    );
                  }
                  else if (state is TodoLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (state is TodosLoaded) {
                    if (state.todos.isEmpty) {
                      return const EmptyTasksWidget(
                        message: 'No tasks for today!',
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: state.todos.length,
                      itemBuilder: (context, index) {
                        final todo = state.todos[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TaskCardWidget(
                            todo: todo,
                          ),
                        );
                      },
                    );
                  }
                  else if (state is TodoError) {
                    return ErrorWidgetWithRetry(
                      message: state.message,
                      onRetry: () {
                        context.read<TodoBloc>().add(
                          FetchTodaysTasksEvent(date: _selectedDate),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundColor: const Color(0xFFD9D9D9),
          backgroundImage: AssetImage(AssetsPath.profile),
        ),
      ),
      actions: [
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            final isDarkMode = state.themeMode == ThemeMode.dark;
            return IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
              icon: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
              ),
            );
          },
        ),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello!",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Text(
            "Livia Vaccaro",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return GestureDetector(
      onTap: () async {
        // Navigate to add task screen and wait for result
        final result = await Navigator.of(context).pushNamed(
          AddTaskScreen.route,
        );

        // If task was added, refresh the list
        if (result == true) {
          context.read<TodoBloc>().add(
            FetchTodaysTasksEvent(date: _selectedDate),
          );
        }
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF6338F1),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6338F1).withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  void _showUnauthorizedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Session Expired'),
        content: const Text('Please login again to continue.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}