class UserProfile {
  final String fullName;
  final String icNumber;
  final String phoneNumber;
//   final String organizationId;
//   final String organizationName;

  UserProfile({
    required this.fullName,
    required this.icNumber,
    required this.phoneNumber,
    // required this.organizationId,
    // required this.organizationName,
  });

  factory UserProfile.fromPrefs(Map<String, String> prefs) {
    return UserProfile(
      fullName: prefs['full_name'] ?? '',
      icNumber: prefs['ic_number'] ?? '',
      phoneNumber: prefs['phone_number'] ?? '',
    //   organizationId: prefs['organization_id'] ?? '',
    //   organizationName: prefs['organization_name'] ?? '',
    );
  }

  Map<String, String> toPrefs() {
    return {
      'full_name': fullName,
      'ic_number': icNumber,
      'phone_number': phoneNumber,
    //   'organization_id': organizationId,
    //   'organization_name': organizationName,
    };
  }
}
