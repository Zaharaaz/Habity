import 'package:flutter/material.dart';
import 'package:habity/models/habit.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;
  final VoidCallback onToggle;

  const HabitTile({
    super.key,
    required this.habit,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: habit.isCompleted
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08)
            : Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Card(
        elevation: habit.isCompleted ? 1 : 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Text(
            habit.icon,
            style: const TextStyle(fontSize: 26),
          ),
          title: Text(
            habit.name,
            style: TextStyle(
              decoration:
                  habit.isCompleted ? TextDecoration.lineThrough : null,
              color:
                  habit.isCompleted ? Colors.grey : Colors.black,
            ),
          ),
          trailing: GestureDetector(
            onTap: onToggle,
            child: AnimatedScale(
              scale: habit.isCompleted ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                habit.isCompleted
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: habit.isCompleted
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
