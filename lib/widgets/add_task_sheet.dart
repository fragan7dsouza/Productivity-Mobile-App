import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F1115) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 18,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 6,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(height: 18),
            const Text("New Task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Task name",
                filled: true,
                fillColor: isDark ? Colors.white10 : const Color(0xFFF6F5FB),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isEmpty) return;
                Navigator.pop(context, Task(title: text));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text("Add Task"),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
