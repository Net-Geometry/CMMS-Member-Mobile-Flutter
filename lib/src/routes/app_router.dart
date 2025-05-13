import 'package:flutter/material.dart';
// AUTH
import '../screens/auth/login_page.dart';
import '../screens/auth/forgot_password_page.dart';
import '../screens/auth/verification_code_page.dart';
import '../screens/auth/reset_password_page.dart';

// DASHBOARD
import '../screens/dashboard/staff_assistant_dashboard.dart';
import '../screens/dashboard/staff_manager_dashboard.dart';

// ATTENDANCE
import '../screens/attendance/history_page.dart';
import '../screens/attendance/staff_clockin_page.dart';


final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginPage(),
  '/forgot-password': (context) => const ForgotPasswordPage(),
  '/verification': (context) => const VerificationCodePage(),
  '/forgot-password': (context) => const ForgotPasswordPage(),
  '/reset-password': (context) => const ResetPasswordPage(),
  '/manager': (context) => const StaffManagerDashboard(),
  '/assistant': (context) => const StaffAssistantDashboard(),
  '/attendance-history': (context) => const AttendanceHistoryPage(),
  '/clockin': (context) => const StaffClockInPage(),
};
