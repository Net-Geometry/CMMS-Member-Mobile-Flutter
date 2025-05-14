class UserProfile {
  final String fullName;
  final String icNumber;
  final String phoneNumber;
  final String? createdAt;        // ISO-8601 timestamp, e.g. "2025-03-28T11:41:00Z"
  final String? profileImageUrl;  // URL for avatar, if any

  UserProfile({
    required this.fullName,
    required this.icNumber,
    required this.phoneNumber,
    this.createdAt,
    this.profileImageUrl,
  });

  /// Construct from a map (e.g. values read from SharedPreferences)
  factory UserProfile.fromPrefs(Map<String, String?> prefs) {
    return UserProfile(
      fullName: prefs['full_name']        ?? '',
      icNumber: prefs['ic_number']       ?? '',
      phoneNumber: prefs['phone_number'] ?? '',
      createdAt: prefs['created_at'],
      profileImageUrl: prefs['profile_image'],
    );
  }

  /// Convert back into a map for saving to SharedPreferences
  Map<String, String> toPrefs() {
    final map = <String, String>{
      'full_name':   fullName,
      'ic_number':   icNumber,
      'phone_number': phoneNumber,
    };
    if (createdAt != null)     map['created_at']     = createdAt!;
    if (profileImageUrl != null) map['profile_image'] = profileImageUrl!;
    return map;
  }
}