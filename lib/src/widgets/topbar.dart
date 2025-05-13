import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile.dart';

class TopBar extends StatefulWidget {
  final VoidCallback onNotificationTap;

  const TopBar({
    super.key,
    required this.onNotificationTap,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String fullName = '';

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    // final profile = UserProfile.fromPrefs(prefs.getStringMap());
    final profile = UserProfile.fromPrefs({
      'full_name': prefs.getString('full_name') ?? '',
      'ic_number': prefs.getString('ic_number') ?? '',
      'phone_number': prefs.getString('phone_number') ?? '',
      // 'organization_id': prefs.getString('organization_id') ?? '',
      // 'organization_name': prefs.getString('organization_name') ?? '',
    });

    setState(() {
      fullName = profile.fullName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, topPadding + 12, 16, 12),
      child: Row(
        children: [
          const CircleAvatar(radius: 22, child: Icon(Icons.person)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome back 👋",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
                Text(fullName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          IconButton(
            onPressed: widget.onNotificationTap,
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}