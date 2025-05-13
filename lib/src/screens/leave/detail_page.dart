import 'package:flutter/material.dart';

class LeaveDetailPage extends StatelessWidget {
  const LeaveDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leave Detail")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Leave Type: Annual", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Duration: 24 April - 26 April"),
            SizedBox(height: 8),
            Text("Status: Approved", style: TextStyle(color: Colors.green)),
            SizedBox(height: 8),
            Text("Reason: Family trip")
          ],
        ),
      ),
    );
  }
}