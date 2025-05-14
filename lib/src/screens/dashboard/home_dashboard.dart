import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cmms_member_mobile_flutter/src/layouts/main_layout.dart';
import 'package:cmms_member_mobile_flutter/src/screens/dashboard/components/home_content.dart';
import 'package:cmms_member_mobile_flutter/src/screens/profile/profile_page.dart';
import 'package:cmms_member_mobile_flutter/src/screens/booking/booking_pc_page.dart';
import 'package:cmms_member_mobile_flutter/src/screens/settings/settings_page.dart';
import 'package:cmms_member_mobile_flutter/src/screens/location/near_me_page.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      pages: const [
        HomeDashboardContent(),      // Home
        MemberProfilePage(),       // Member Profile
        BookingPCPage(),     // Booking
        MemberSettingsPage(),               // Settings
        NearMePage(),          // Near Me
      ],
    );
  }
}
