import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedFab extends StatelessWidget {
  final VoidCallback onTap;

  const FrostedFab({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 74,
        height: 74,
        margin: const EdgeInsets.only(bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color:
                    isDark ? Colors.white10 : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 6)),
                ],
              ),
              child: Center(
                child: Icon(Icons.add,
                    size: 30, color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
