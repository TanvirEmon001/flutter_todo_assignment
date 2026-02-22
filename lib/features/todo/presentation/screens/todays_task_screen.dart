import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_management/core/presentation/bloc/theme/theme_bloc.dart';
import 'package:todo_management/core/presentation/bloc/theme/theme_bloc.dart';
import 'package:todo_management/core/utils/assets_path.dart';
import 'package:todo_management/features/todo/presentation/screens/add_task_screen.dart';
import 'package:todo_management/features/todo/widgets/dynamic_date_strip.dart';
import 'package:todo_management/features/todo/widgets/task_card_widget.dart';

import '../../widgets/task_tab_bar.dart';

class TodaysTaskScreen extends StatefulWidget {
  static const String route = "today-tasks";

  const TodaysTaskScreen({super.key});

  @override
  State<TodaysTaskScreen> createState() => _TodaysTaskScreenState();
}

class _TodaysTaskScreenState extends State<TodaysTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  }, icon: Icon(isDarkMode ? Icons.light_mode : Icons.light_mode_outlined));
            },
          )
        ],
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text("Hello!", style: TextStyle(fontWeight: .w400, fontSize: 14)),
            Text(
              "Livia Vaccaro",
              style: TextStyle(fontWeight: .w600, fontSize: 19),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AddTaskScreen.route);
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
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
      body: Column(
        children: [
          const DynamicDateStrip(),
          const TaskTabBar(),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, index) {
                return const TaskCardWidget();
              },
            ),
          ),
        ],
      ),
    );
  }


}
