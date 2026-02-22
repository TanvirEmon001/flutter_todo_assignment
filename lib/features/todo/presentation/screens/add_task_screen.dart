import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_management/core/common/widgets/custom_button.dart';
import 'package:todo_management/core/utils/assets_path.dart';

class AddTaskScreen extends StatefulWidget {
  static const String route = "add-task";

  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(height: 24, width: 24, AssetsPath.arrowBack),
        ),
        title: const Text(
          "Add Task",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 63,
              width: 331,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SvgPicture.asset(height: 24, width: 24, AssetsPath.taskGroup),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    children: [
                      Text(
                        "Task Group",
                        style: TextStyle(fontWeight: .w400, fontSize: 9),
                      ),
                      Text(
                        "Work",
                        style: TextStyle(fontWeight: .w600, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            Container(
              height: 142,
              width: 331,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text("Description", style: TextStyle(color: const Color(0xFF6E6A7C), fontWeight: .w400),),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      maxLines: 4,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButton(buttonText: 'Add Task', buttonOnTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
