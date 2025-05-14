import 'package:flutter/material.dart';
// AUTH
import '../screens/auth/login_page.dart';
import '../screens/auth/forgot_password_page.dart';
import '../screens/auth/verification_code_page.dart';
import '../screens/auth/reset_password_page.dart';

// DASHBOARD
import '../screens/dashboard/home_dashboard.dart';

import '../screens/profile/profile_page.dart';
import '../screens/profile/personal_info_page.dart';
import '../screens/notification/notification_page.dart';
import '../screens/booking/booking_pc_page.dart';
import '../screens/booking/recent_booking_page.dart';
import '../screens/booking/upcoming_booking_page.dart';
import '../screens/location/near_me_page.dart';
import '../screens/location/center_info_page.dart';
import '../screens/health/health_care_page.dart';
import '../screens/health/health_history_page.dart';
import '../screens/settings/settings_page.dart';
import '../screens/faq/faq_page.dart';
import '../screens/chatbot/chatbot_page.dart';


final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginPage(),
  '/forgot-password': (context) => const ForgotPasswordPage(),
  '/verification': (context) => const VerificationCodePage(),
  '/forgot-password': (context) => const ForgotPasswordPage(),
  '/reset-password': (context) => const ResetPasswordPage(),

  '/member-home': (context) => const HomeDashboard(),
  '/member-profile': (context) => const MemberProfilePage(),
  '/member-personal-info': (context) => const MemberPersonalInfoPage(),
  '/member-notifications': (context) => const MemberNotificationPage(),
  '/booking-pc': (context) => const BookingPCPage(),
  '/recent-booking': (context) => const RecentBookingPage(),
  '/upcoming-booking': (context) => const UpcomingBookingPage(),
  '/near-me': (context) => const NearMePage(),
  '/center-info': (context) => const CenterInformationPage(),
  '/health-care': (context) => const HealthCarePage(),
  '/health-history': (context) => const HealthHistoryPage(),
  '/member-settings': (context) => const MemberSettingsPage(),
  '/member-faq': (context) => const MemberFAQPage(),
  '/chatbot': (context) => const MemberChatBotPage(),
};
