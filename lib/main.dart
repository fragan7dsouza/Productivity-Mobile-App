import 'package:flutter/material.dart';
import 'screens/navigation_controller.dart';

void main() {
  runApp(const ProductivityApp());
}

class ProductivityApp extends StatelessWidget {
  const ProductivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productivity App',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF6F5FB),
        primaryColor: const Color(0xFF6C63FF),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF6C63FF),
          secondary: Color(0xFF8E85FF),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F1115),
        primaryColor: const Color(0xFF8E85FF),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8E85FF),
          secondary: Color(0xFF6C63FF),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const NavigationController(),
    );
  }
}
