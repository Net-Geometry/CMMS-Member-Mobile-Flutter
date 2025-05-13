import 'package:flutter/material.dart';
import 'attendance_card.dart';
import 'leave_balance_card.dart';
import 'schedule_card.dart';
import 'staff_on_leave_card.dart';


class HomeDashboardContent extends StatelessWidget {
  const HomeDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: const [
          AttendanceCard(),
          SizedBox(height: 12),
          LeaveBalanceCard(),
          SizedBox(height: 12),
          UpcomingScheduleCard(),
          SizedBox(height: 12),
          StaffOnLeaveCard(),
        ],
      ),
    );
  }
}
