import 'package:flutter/material.dart';
import 'package:habity/screens/add_habit_screen.dart';
import 'package:provider/provider.dart';
import 'package:habity/providers/habit_provider.dart';
import 'package:habity/widgets/habit_tile.dart';
import 'package:habity/widgets/empty_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HabitProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Daily Habits'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// PROGRESS SECTION
            Text(
              'Today\'s Progress',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: provider.progress,
              minHeight: 10,
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(height: 6),
            Text(
              '${(provider.progress * 100).toInt()}% completed',
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 24),

            /// HABIT LIST
            Expanded(
              child: provider.habits.isEmpty
                ? const EmptyState()
                : ListView.builder(
                    itemCount: provider.habits.length,
                    itemBuilder: (context, index) {
                      final habit = provider.habits[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: HabitTile(
                          habit: habit,
                          onToggle: () {
                            provider.toggleHabit(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      /// ADD BUTTON (nanti connect ke AddHabitScreen)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddHabitScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
