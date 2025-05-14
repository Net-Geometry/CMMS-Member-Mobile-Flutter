import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String fullName = 'User';
  String profileUrl = '';

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final profile = UserProfile.fromPrefs({
      'full_name': prefs.getString('full_name') ?? '',
      'ic_number': prefs.getString('ic_number') ?? '',
      'phone_number': prefs.getString('phone_number') ?? '',
      'organization_id': prefs.getString('organization_id') ?? '',
      'organization_name': prefs.getString('organization_name') ?? '',
    });

    setState(() {
      fullName = profile.fullName;
      // If you store image URL in prefs in future, use it here
      profileUrl = prefs.getString('profile_image') ?? ''; // fallback to empty
    });
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.fromLTRB(16, topPadding + 12, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'CMMS',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5F26B4),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/member-profile'),
            child: Row(
              children: [
                Text(fullName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 18,
                  backgroundImage: profileUrl.isNotEmpty
                      ? NetworkImage(profileUrl)
                      : const AssetImage('assets/images/default_profile.png') as ImageProvider,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
