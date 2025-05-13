import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> saveUserProfile(Map<String, dynamic> profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('full_name', profile['full_name'] ?? '');
    await prefs.setString('ic_number', profile['ic_number'] ?? '');
    await prefs.setString('phone_number', profile['phone_number'] ?? '');
  }

  static Future<Map<String, String>> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'full_name': prefs.getString('full_name') ?? '',
      'ic_number': prefs.getString('ic_number') ?? '',
      'phone_number': prefs.getString('phone_number') ?? '',
    };
  }

  static Future<void> clearUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('full_name');
    await prefs.remove('ic_number');
    await prefs.remove('phone_number');
  }
}
