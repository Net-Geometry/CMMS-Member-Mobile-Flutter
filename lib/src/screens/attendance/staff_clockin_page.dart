import 'package:flutter/material.dart';

class StaffClockInPage extends StatelessWidget {
  const StaffClockInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Tap to Clock In", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5F26B4),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(40),
              ),
              icon: const Icon(Icons.fingerprint, size: 36),
              label: const SizedBox.shrink(),
              onPressed: () {
                // Handle clock in
              },
            ),
          ],
        ),
      ),
    );
  }
}
