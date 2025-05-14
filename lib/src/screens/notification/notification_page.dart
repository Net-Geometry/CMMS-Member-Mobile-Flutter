import 'package:flutter/material.dart';

class MemberNotificationPage extends StatefulWidget {
  const MemberNotificationPage({super.key});

  @override
  State<MemberNotificationPage> createState() => _MemberNotificationPageState();
}

class _MemberNotificationPageState extends State<MemberNotificationPage> {
  String selectedTab = 'All';

  final notifications = [
    {'type': 'mention', 'user': 'Mike Johnson', 'message': 'mentioned you in a comment', 'time': '2 hours ago'},
    {'type': 'system', 'message': 'Your booking #2458 has been confirmed', 'time': 'Yesterday at 2:30 PM'},
    {'type': 'like', 'message': 'Sarah Wilson liked your review', 'time': 'Yesterday at 10:15 AM'},
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = selectedTab == 'All'
        ? notifications
        : notifications.where((n) =>
            (selectedTab == 'Unread' && n['type'] == 'mention') ||
            (selectedTab == 'Mentions' && n['type'] == 'mention')
          ).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_all_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _buildTab("All"),
                const SizedBox(width: 8),
                _buildTab("Unread"),
                const SizedBox(width: 8),
                _buildTab("Mentions"),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: filtered.isEmpty && selectedTab == 'Unread'
                ? _buildEmptyState()
                : ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final notif = filtered[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: const AssetImage('assets/images/default_profile.png'),
                        ),
                        title: Text(
                          notif['user'] != null
                              ? "${notif['user']} ${notif['message'] as String}"
                              : notif['message'] as String,
                          style: const TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(notif['time'] ?? '', style: const TextStyle(fontSize: 12)),
                        trailing: notif['type'] == 'system'
                            ? const Icon(Icons.check_circle, color: Colors.green)
                            : null,
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  Widget _buildTab(String label) {
    final isActive = selectedTab == label;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF5F26B4) : const Color(0xFFE5E5E5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.black87)),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.notifications_off_outlined, size: 48, color: Colors.black26),
          SizedBox(height: 12),
          Text("No more unread notifications", style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 4),
          Text("You're all caught up! Check back later for new notifications.", textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
