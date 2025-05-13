import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final supabase = Supabase.instance.client;

class AuthResult {
  final bool success;
  final String? errorMessage;
  final String? userType;

  AuthResult({required this.success, this.errorMessage, this.userType});
}

class AuthService {
  static Future<AuthResult> loginWithEmail(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        return AuthResult(success: false, errorMessage: "Invalid login");
      }

      final profile = await supabase
          .from('profiles')
          .select('user_type, full_name, ic_number, phone_number')
          .eq('id', user.id)
          .single();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('full_name', profile['full_name'] ?? '');
      await prefs.setString('ic_number', profile['ic_number'] ?? '');
      await prefs.setString('phone_number', profile['phone_number'] ?? '');
    //   await prefs.setString('organization_id', profile['organization_id'] ?? ''); will fetch from organizations table
    //   await prefs.setString('organization_name', profile['organizations']?['name'] ?? '');

      return AuthResult(success: true, userType: profile['user_type']);
    } catch (e) {
      return AuthResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<void> logout() async {
    await supabase.auth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<bool> isLoggedIn() async {
    final session = supabase.auth.currentSession;
    return session != null;
  }
}
