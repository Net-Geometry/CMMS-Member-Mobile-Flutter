import 'package:flutter/material.dart';

class UpcomingScheduleCard extends StatelessWidget {
  const UpcomingScheduleCard();

  @override
  Widget build(BuildContext context) {
    final schedules = [
      {"day": "Wednesday", "time": "Tomorrow, 8:00 AM - 4:00 PM", "icon": Icons.event, "color": Colors.green.shade100},
      {"day": "Thursday", "time": "24 April, 2:00 PM - 10:00 PM", "icon": Icons.event, "color": Colors.blue.shade100},
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Upcoming Schedule", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...schedules.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: e["color"] as Color,
                    radius: 16,
                    child: const Icon(Icons.calendar_today, size: 16),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e["day"] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(e["time"] as String, style: const TextStyle(fontSize: 12)),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
