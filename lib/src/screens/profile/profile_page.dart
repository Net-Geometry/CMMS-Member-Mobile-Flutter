import 'package:flutter/material.dart';

class MemberProfilePage extends StatelessWidget {
  const MemberProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(radius: 28, backgroundImage: AssetImage('assets/images/default_profile.png')),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("John Smith", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("Member since March 2025", style: TextStyle(color: Colors.black54)),
                      Text("031028-10-2354", style: TextStyle(color: Colors.black45, fontSize: 12)),
                    ],
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHealthStat("BMI", "22.4", Icons.photo_camera_back),
              _buildHealthStat("Blood Pressure", "120/80", Icons.favorite),
              _buildHealthStat("Cholesterol", "180mg/dL", Icons.water_drop),
            ],
          ),
          const SizedBox(height: 24),
          _buildMenuItem(context, "Personal Information", Icons.person_outline, "/member-personal-info"),
          _buildMenuItem(context, "Health Information", Icons.health_and_safety, null),
          _buildMenuItem(context, "Notifications", Icons.notifications_none, "/member-notifications"),
          _buildMenuItem(context, "Security", Icons.shield_outlined, null),
          _buildMenuItem(context, "Language", Icons.language, null, trailing: const Text("English")),
          _buildMenuItem(context, "Help & Support", Icons.help_outline, null),
          const Divider(height: 32),
          _buildMenuItem(context, "Log Out", Icons.logout, null, color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildHealthStat(String title, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF4EEFC),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(icon, color: Color(0xFF5F26B4)),
              const SizedBox(height: 8),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 12))
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, String? route, {Widget? trailing, Color? color}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      leading: Icon(icon, color: color ?? const Color(0xFF5F26B4)),
      title: Text(title, style: TextStyle(color: color ?? Colors.black)),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: route != null ? () => Navigator.pushNamed(context, route) : null,
    );
  }
}