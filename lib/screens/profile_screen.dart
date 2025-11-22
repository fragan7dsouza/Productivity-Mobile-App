import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor:
                          isDark ? Colors.white10 : Colors.grey[300],
                      child: Icon(Icons.person,
                          size: 55,
                          color: isDark ? Colors.white70 : Colors.black54),
                    ),
                    const SizedBox(height: 12),
                    const Text("Fragan Dsouza",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600)),
                    const Text("B.Tech CSE • NMAMIT",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              _tile(Icons.person_outline, "Account"),
              _tile(Icons.notifications_outlined, "Notifications"),
              _tile(Icons.color_lens_outlined, "Appearance"),
              _tile(Icons.lock_outline, "Privacy & Security"),
              _tile(Icons.help_outline, "Help & Support"),
              const Spacer(),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text("Log Out",
                      style: TextStyle(
                          color: Colors.red[400],
                          fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tile(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white.withOpacity(0.85),
          boxShadow: const [
            BoxShadow(
                blurRadius: 10, offset: Offset(0, 4), color: Colors.black12)
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.grey[700]),
            const SizedBox(width: 14),
            Text(label,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const Spacer(),
            Icon(Icons.arrow_forward_ios,
                size: 18, color: Colors.grey[500]),
          ],
        ),
      ),
    );
  }
}
