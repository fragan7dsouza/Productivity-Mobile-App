import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'calendar_screen.dart';
import 'tasks_screen.dart';
import 'settings_screen.dart';
import 'profile_screen.dart';
import '../widgets/frosted_bottom_nav.dart';
import '../widgets/frosted_fab.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int index = 0;

  final screens = [
  const HomeScreen(),
  const CalendarScreen(),
  const TasksScreen(),
  const SettingsScreen(),
  const ProfileScreen(),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FrostedFab(
        onTap: () => setState(() => index = 2),
      ),
      bottomNavigationBar: FrostedBottomNav(
        selectedIndex: index,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}
