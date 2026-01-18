import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:habity/models/habit.dart';

class HabitProvider extends ChangeNotifier {
  static const String boxName = 'habitsBox';

  List<Habit> _habits = [];
  List<Habit> get habits => _habits;

  /// load data pertama kali
  Future<void> loadHabits() async {
    final box = await Hive.openBox<Habit>(boxName);
    _habits = box.values.toList();

    _checkDailyReset();
    notifyListeners();
  }

  /// tambah habit
  Future<void> addHabit(Habit habit) async {
    final box = Hive.box<Habit>(boxName);
    await box.add(habit);
    _habits.add(habit);
    notifyListeners();
  }

  /// toggle checklist
  void toggleHabit(int index) {
    final habit = _habits[index];
    habit.isCompleted = !habit.isCompleted;
    habit.lastUpdated = DateTime.now();
    habit.save();
    notifyListeners();
  }

  /// hitung progress
  double get progress {
    if (_habits.isEmpty) return 0;
    final completed =
        _habits.where((habit) => habit.isCompleted).length;
    return completed / _habits.length;
  }

  /// reset otomatis kalau ganti hari
  void _checkDailyReset() {
    final now = DateTime.now();

    for (var habit in _habits) {
      final last = habit.lastUpdated;
      final isDifferentDay =
          now.year != last.year ||
          now.month != last.month ||
          now.day != last.day;

      if (isDifferentDay) {
        habit.isCompleted = false;
        habit.lastUpdated = now;
        habit.save();
      }
    }
  }
}
