import 'package:flutter/material.dart';

class FrostedBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const FrostedBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF0F1115).withOpacity(0.85)
            : Colors.white.withOpacity(0.8),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, blurRadius: 12, offset: Offset(0, -4))
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _item(Icons.home, "Home", 0),
            _item(Icons.calendar_today, "Calendar", 1),
            const SizedBox(width: 64),
            _item(Icons.checklist, "Tasks", 2),
            _item(Icons.settings, "Settings", 3),
          ],
        ),
      ),
    );
  }

  Widget _item(IconData icon, String label, int index) {
    final active = index == selectedIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: active ? Colors.deepPurple : Colors.grey),
          const SizedBox(height: 4),
          Text(label,
              style: TextStyle(
                  fontSize: 12,
                  color: active ? Colors.deepPurple : Colors.grey)),
        ],
      ),
    );
  }
}
