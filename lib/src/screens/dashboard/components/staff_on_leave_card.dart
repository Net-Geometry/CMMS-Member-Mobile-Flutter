import 'package:flutter/material.dart';

class StaffOnLeaveCard extends StatelessWidget {
  const StaffOnLeaveCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Staff on Leave", style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: "Today",
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: "Today", child: Text("Today")),
                    DropdownMenuItem(value: "This Week", child: Text("This Week")),
                  ],
                  onChanged: (_) {},
                ),
              ],
            ),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3")),
              title: const Text("John Smith"),
              subtitle: const Text("Annual Leave\nAssistant Manager"),
              isThreeLine: true,
            )
          ],
        ),
      ),
    );
  }
}
