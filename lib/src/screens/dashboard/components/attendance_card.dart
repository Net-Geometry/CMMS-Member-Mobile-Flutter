import 'package:flutter/material.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Attendance", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("23 April, 2025"),
            const SizedBox(height: 8),
            const Text("Clock In Time", style: TextStyle(fontSize: 13)),
            const Text("08:30 AM", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5F26B4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Clock Out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
