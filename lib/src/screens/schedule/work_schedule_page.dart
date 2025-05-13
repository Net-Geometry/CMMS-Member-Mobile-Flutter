import 'package:flutter/material.dart';

class WorkSchedulePage extends StatelessWidget {
  const WorkSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Work Schedule")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text("Monday"), subtitle: Text("8:00 AM – 5:00 PM")),
          ListTile(title: Text("Tuesday"), subtitle: Text("8:00 AM – 5:00 PM")),
          ListTile(title: Text("Wednesday"), subtitle: Text("8:00 AM – 5:00 PM")),
        ],
      ),
    );
  }
}