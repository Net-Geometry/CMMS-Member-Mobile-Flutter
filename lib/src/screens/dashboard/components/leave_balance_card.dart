import 'package:flutter/material.dart';

class LeaveBalanceCard extends StatelessWidget {
  const LeaveBalanceCard();

  @override
  Widget build(BuildContext context) {
    final items = [
      {"label": "Annual", "value": "12/12"},
      {"label": "Medical", "value": "3/5"},
      {"label": "Replacement", "value": "2/3"},
      {"label": "Emergency", "value": "2/2"},
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Leave Balance", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.map((item) {
                return Column(
                  children: [
                    Text(item["value"]!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF5F26B4))),
                    Text(item["label"]!, style: const TextStyle(fontSize: 12)),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
