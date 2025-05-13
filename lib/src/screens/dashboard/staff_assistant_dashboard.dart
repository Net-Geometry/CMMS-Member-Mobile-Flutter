import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cmms_member_mobile_flutter/src/layouts/main_layout.dart';
import 'package:cmms_member_mobile_flutter/src/screens/dashboard/components/home_content.dart';
import 'package:cmms_member_mobile_flutter/src/screens/leave/management_page.dart';
import 'package:cmms_member_mobile_flutter/src/screens/attendance/history_page.dart';
import 'package:cmms_member_mobile_flutter/src/screens/payroll/payroll_page.dart';
import 'package:cmms_member_mobile_flutter/src/screens/schedule/work_schedule_page.dart';

class StaffAssistantDashboard extends StatelessWidget {
  const StaffAssistantDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      pages: const [
        HomeDashboardContent(),      // Home
        LeaveManagementPage(),       // Leave
        AttendanceHistoryPage(),     // Attendance
        PayrollPage(),               // Payroll
        WorkSchedulePage(),          // Schedule
      ],
    );
  }
}
