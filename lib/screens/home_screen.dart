import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';
import '../widgets/add_task_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(title: "Design project wireframe"),
    Task(title: "Finish CloudOps dashboard API", done: true),
    Task(title: "Train StegaMind epoch #3"),
  ];

  String _formattedDate() {
    final now = DateTime.now();
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return "${months[now.month - 1]} ${now.day}, ${now.year}";
  }

  

   

  @override
  Widget build(BuildContext context) {
    final completed = tasks.where((t) => t.done).length;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good morning, Fragan 👋",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _formattedDate(),
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black54,
                        ),
                      )
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: isDark ? Colors.white10 : Colors.grey[200],
                  child: Icon(Icons.person,
                      color: isDark ? Colors.white70 : Colors.black54),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 6),
            _todayCard(completed),
            const SizedBox(height: 18),
            Expanded(child: _taskList()),
          ],
        ),
      ),
      floatingActionButton: null,
    );
  }

  Widget _todayCard(int completed) {
    final total = tasks.length;
    final progress = total == 0 ? 0.0 : completed / total;


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Today's Tasks",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Text("$completed of $total completed",
                          style: TextStyle(color: Colors.grey[600])),
                      const SizedBox(height: 12),
                      LinearProgressIndicator(value: progress, minHeight: 8),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.checklist, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _taskList() {
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) => GestureDetector(
        onTap: () => setState(() => tasks[i].done = !tasks[i].done),
        child: TaskCard(task: tasks[i]),
      ),
    );
  }
}
