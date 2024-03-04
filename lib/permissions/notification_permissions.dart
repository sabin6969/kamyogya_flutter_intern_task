import 'package:permission_handler/permission_handler.dart';

class NotificationPermission {
  static Future<void> askForNotificationPermission() async {
    Permission.notification.request().then(
      (PermissionStatus status) {
        if (status.isGranted) {
          return;
        } else if (status.isDenied) {
          openAppSettings();
        } else if (status.isPermanentlyDenied) {
          openAppSettings();
        } else if (status.isRestricted) {
          openAppSettings();
        }
      },
    );
  }
}
