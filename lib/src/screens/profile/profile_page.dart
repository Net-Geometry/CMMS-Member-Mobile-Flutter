import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../models/user_profile.dart';

class MemberProfilePage extends StatefulWidget {
  const MemberProfilePage({super.key});

  @override
  State<MemberProfilePage> createState() => _MemberProfilePageState();
}

class _MemberProfilePageState extends State<MemberProfilePage> {
  String fullName = 'Member';
  String memberSince = '';
  String icNumber = '';
  String? profileUrl;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final profile = UserProfile.fromPrefs({
      'full_name': prefs.getString('full_name'),
      'ic_number': prefs.getString('ic_number'),
      'phone_number': prefs.getString('phone_number'),
      'created_at': prefs.getString('created_at'),
      'profile_image': prefs.getString('profile_image'),
    });

    String since = '';
    if (profile.createdAt != null && profile.createdAt!.isNotEmpty) {
      final parsed = DateTime.tryParse(profile.createdAt!);
      if (parsed != null) {
        since = DateFormat('MMMM yyyy').format(parsed);
      }
    }

    setState(() {
      fullName = profile.fullName;
      icNumber = profile.icNumber;
      profileUrl = profile.profileImageUrl;
      memberSince = since.isNotEmpty ? 'Member since $since' : '';
    });
  }

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
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: profileUrl != null && profileUrl!.isNotEmpty
                        ? NetworkImage(profileUrl!)
                        : const AssetImage('assets/images/default_profile.png') as ImageProvider,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fullName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      if (memberSince.isNotEmpty)
                        Text(memberSince,
                            style: const TextStyle(color: Colors.black54)),
                      if (icNumber.isNotEmpty)
                        Text(icNumber,
                            style: const TextStyle(
                                color: Colors.black45, fontSize: 12)),
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
              _buildHealthStat("BMI", "22.4", Icons.fitness_center),
              _buildHealthStat("Blood Pressure", "120/80", Icons.favorite),
              _buildHealthStat("Cholesterol", "180mg/dL", Icons.water_drop),
            ],
          ),

          const SizedBox(height: 24),
          _buildMenuItem(context, "Personal Information", Icons.person_outline, "/member-personal-info"),
          _buildMenuItem(context, "Health Information", Icons.health_and_safety, null),
          _buildMenuItem(context, "Notifications", Icons.notifications_none, "/member-notifications"),
          _buildMenuItem(context, "Security", Icons.shield_outlined, null),
          _buildMenuItem(context, "Language", Icons.language, null,
              trailing: const Text("English")),
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
              Icon(icon, color: const Color(0xFF5F26B4)),
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

  Widget _buildMenuItem(BuildContext context, String title, IconData icon,
      String? route,
      {Widget? trailing, Color? color}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      leading: Icon(icon, color: color ?? const Color(0xFF5F26B4)),
      title: Text(title, style: TextStyle(color: color ?? Colors.black)),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: route != null ? () => Navigator.pushNamed(context, route) : null,
    );
  }
}
