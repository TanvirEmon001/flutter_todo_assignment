import 'package:flutter/material.dart';
class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331,
      height: 142,
      padding: const EdgeInsets.all(16),
      alignment: .center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: .center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "ID: 01",
                style: TextStyle(
                  color: Color(0xFF6E6A7C),
                  fontWeight: FontWeight.w400,
                  fontSize: 11
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

          const Text(
            "Market Research",
            style: TextStyle(
              fontSize: 14,
              fontWeight: .w400,
              color: Color(0xFF2D2D2D),
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time_filled, size: 16, color: Color(0xFF9575CD)),
                  const SizedBox(width: 4),
                  const Text(
                    "10:00 AM (10 minutes ago)",
                    style: TextStyle(
                      color: Color(0xFF9575CD),
                      fontSize: 11,
                      fontWeight: .w400
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE7F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(
                    color: Color(0xFF7E57C2),
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
}
