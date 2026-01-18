import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:habity/providers/habit_provider.dart';
import 'package:habity/screens/home_screen.dart';
import 'package:habity/models/habit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 INI YANG HILANG
  await Hive.initFlutter();
  Hive.registerAdapter(HabitAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HabitProvider()..loadHabits(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily Habit Tracker',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFBFA2DB),
          ),
          fontFamily: 'Poppins',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
