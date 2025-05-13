import 'package:flutter/material.dart';

class LeaveManagementPage extends StatelessWidget {
  const LeaveManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leave Management")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: const Text("Annual Leave - 3 days"),
            subtitle: const Text("Status: Pending"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, '/leave-detail'),
          ),
        ),
      ),
    );
  }
}
