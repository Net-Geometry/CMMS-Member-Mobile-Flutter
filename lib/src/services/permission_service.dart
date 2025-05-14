import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  /// Request all necessary permissions for the app
  static Future<void> requestAllPermissions() async {
    await [
      Permission.camera,
      Permission.locationWhenInUse,
      Permission.storage,
      Permission.photos, // for iOS
    ].request();
  }

  /// Check if camera permission is granted
  static Future<bool> isCameraGranted() async {
    return await Permission.camera.isGranted;
  }

  /// Check if location permission is granted
  static Future<bool> isLocationGranted() async {
    return await Permission.locationWhenInUse.isGranted;
  }

  /// Request camera permission
  static Future<bool> requestCamera() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  /// Request location permission
  static Future<bool> requestLocation() async {
    final status = await Permission.locationWhenInUse.request();
    return status.isGranted;
  }

  /// Request storage permission
  static Future<bool> requestStorage() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }
}
