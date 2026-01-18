import 'package:hive/hive.dart';

part 'habit.g.dart';

@HiveType(typeId: 0)
class Habit extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String icon; // emoji atau icon code

  @HiveField(2)
  bool isCompleted;

  @HiveField(3)
  DateTime lastUpdated;

  Habit({
    required this.name,
    required this.icon,
    this.isCompleted = false,
    required this.lastUpdated,
  });
}
