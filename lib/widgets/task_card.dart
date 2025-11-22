import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF131416) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, 6)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: task.done
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: task.done
                ? const Icon(Icons.check, color: Colors.white)
                : const SizedBox.shrink(),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                const Text('No details',
                    style: TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.more_horiz, color: Colors.grey),
        ],
      ),
    );
  }
}
