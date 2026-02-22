import 'package:flutter/material.dart';

class TaskTabBar extends StatefulWidget {
  const TaskTabBar({super.key});

  @override
  State<TaskTabBar> createState() => _TaskTabBarState();
}

class _TaskTabBarState extends State<TaskTabBar> {
  int _selectedIndex = 0;

  final List<String> _tabs = ['All', 'To do', 'In Progress', 'Completed'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(

          children: List.generate(_tabs.length, (index) {
            bool isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}