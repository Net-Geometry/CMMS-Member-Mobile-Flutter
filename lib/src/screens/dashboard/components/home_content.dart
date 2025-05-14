import 'package:flutter/material.dart';

class HomeDashboardContent extends StatelessWidget {
  const HomeDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shortcut buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildShortcut(icon: Icons.history, label: 'Booking History'),
              _buildShortcut(icon: Icons.mail_outline, label: 'Inbox'),
              _buildShortcut(icon: Icons.location_on_outlined, label: 'NADI Location'),
              _buildShortcut(icon: Icons.health_and_safety_outlined, label: 'Health Care'),
            ],
          ),
          const SizedBox(height: 20),

          // Last login
          const Text(
            'Last login on 28 Mar 2025, 11:41 am. Pull to refresh.',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 16),

          // Upcoming Booking
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Upcoming Booking', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('See All', style: TextStyle(color: Color(0xFF5F26B4)))
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4EEFC),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('PC Station 01\nToday, 5:00 PM',
                          style: TextStyle(color: Colors.black87)),
                      Icon(Icons.arrow_forward_ios, size: 16)
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5F26B4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Reschedule', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Need Help section
          const Text('Need help?', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4EEFC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: const [
                        Icon(Icons.help_outline, size: 32),
                        SizedBox(height: 8),
                        Text('FAQ', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4EEFC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: const [
                        Icon(Icons.chat_bubble_outline, size: 32),
                        SizedBox(height: 8),
                        Text('Chat Now', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildShortcut({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF4EEFC),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: Color(0xFF5F26B4)),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12))
      ],
    );
  }
}
