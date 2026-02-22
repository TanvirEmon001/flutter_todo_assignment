import 'package:flutter/material.dart';

class DynamicDateStrip extends StatelessWidget {
  const DynamicDateStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();


    final monthName = _getMonthName(today.month);


    final dates = List.generate(5, (index) {
      return DateTime(today.year, today.month, today.day + index);
    });

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dates.map((date) {
          bool isCurrentDate = date.year == today.year &&
              date.month == today.month &&
              date.day == today.day;

          return Container(
            width: 64,
            height: 84,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: isCurrentDate ? const Color(0xFF5F33E1) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: isCurrentDate ? [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ] : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _getMonthName(date.month),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: .w400,
                    color: isCurrentDate ? Colors.white : Colors.grey[700],
                  ),
                ),
                Text(
                  date.day.toString(),
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: .w600,
                    color: isCurrentDate ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  _getWeekdayAbbreviation(date.weekday),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: .w400,
                    color: isCurrentDate ? Colors.white : Colors.grey[700],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  String _getWeekdayAbbreviation(int weekday) {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays[weekday - 1];
  }
}