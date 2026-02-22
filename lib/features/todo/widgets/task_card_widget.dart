import 'package:flutter/material.dart';
import '../data/models/todo_model.dart';

class TaskCardWidget extends StatelessWidget {
  final TodoModel todo;

  const TaskCardWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {

    final String status = todo.completed ? "Done" : "Pending";
    final Color statusColor = todo.completed
        ? const Color(0xFF7E57C2)
        : const Color(0xFFFF9800);
    final Color statusBgColor = todo.completed
        ? const Color(0xFFEDE7F6)
        : const Color(0xFFFFF3E0);

    return Container(
      width: double.infinity, // Take full width
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ID: ${todo.id.toString().padLeft(2, '0')}",
                style: const TextStyle(
                  color: Color(0xFF6E6A7C),
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBF0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.work_outline,
                  size: 18,
                  color: Color(0xFFF06292),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),


          Text(
            todo.todo,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF2D2D2D),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Time information
              Row(
                children: [
                  const Icon(
                    Icons.access_time_filled,
                    size: 16,
                    color: Color(0xFF9575CD),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _getTimeDisplay(),
                    style: const TextStyle(
                      color: Color(0xFF9575CD),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              // Status badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  String _getTimeDisplay() {
    return "10:00 AM (Today)";
  }
}