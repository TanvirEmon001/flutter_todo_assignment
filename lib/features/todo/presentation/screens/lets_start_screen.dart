import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_management/core/common/widgets/custom_button.dart';
import 'package:todo_management/core/utils/assets_path.dart';
import 'package:todo_management/features/todo/presentation/screens/todays_task_screen.dart';

class LetsStartScreen extends StatelessWidget {
  static const String route = "let's-start";
  const LetsStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(AssetsPath.female),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(16),
                alignment: .center,
                child: Column(
                  children: const [
                    Text(
                      "Task Management & To-Do List",
                      textAlign: .center,
                      style: TextStyle(fontWeight: .w600, fontSize: 24),
                    ),

                    SizedBox(height: 10,),

                    Text(
                      "This productive tool is designed to help you better manage your task project-wise conveniently!",
                      textAlign: .center,
                      style: TextStyle(fontWeight: .w400, fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              CustomButton(
                buttonText: "Let's Start",
                buttonOnTap: () {
                  Navigator.of(context).pushReplacementNamed(TodaysTaskScreen.route);
                },
                buttonIcon: AssetsPath.arrowRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
