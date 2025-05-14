import 'package:flutter/material.dart';

class MemberSettingsPage extends StatefulWidget {
  const MemberSettingsPage({super.key});

  @override
  State<MemberSettingsPage> createState() => _MemberSettingsPageState();
}

class _MemberSettingsPageState extends State<MemberSettingsPage> {
  bool darkMode = false;
  bool autoUpdate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _buildSectionTitle("Account Preferences"),
          _buildSwitchTile("Dark Mode", "Off", darkMode, (val) => setState(() => darkMode = val)),
          _buildListTile("Push Notifications", "Enabled", Icons.notifications_none, onTap: () {}),
          _buildListTile("Privacy", "Manage your data", Icons.lock_outline, onTap: () {}),

          const SizedBox(height: 16),
          _buildSectionTitle("App Settings"),
          _buildListTile("Language & Region", "English (US)", Icons.language, onTap: () {}),
          _buildListTile("Storage", "1.2 GB used", Icons.storage_outlined, onTap: () {}),
          _buildSwitchTile("Auto Update", "On", autoUpdate, (val) => setState(() => autoUpdate = val)),

          const SizedBox(height: 16),
          _buildSectionTitle("About"),
          _buildListTile("App Info", "Version 2.1.0", Icons.info_outline, onTap: () {}),
          _buildListTile("Help Center", null, Icons.help_outline, onTap: () {}),
          _buildListTile("Terms & Privacy Policy", null, Icons.policy_outlined, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(title,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black54)),
    );
  }

  Widget _buildListTile(String title, String? subtitle, IconData icon, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF5F26B4)),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(fontSize: 12)) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      secondary: const Icon(Icons.settings, color: Color(0xFF5F26B4)),
      value: value,
      onChanged: onChanged,
    );
  }
}