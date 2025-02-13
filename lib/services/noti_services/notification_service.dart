import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // INITIALIZE
  Future<void> initNotification() async {
    if (_isInitialized) return;

    tz.initializeTimeZones();
    final String currentTimezone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimezone));
    
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initSettings = InitializationSettings(
      iOS: initSettingsIOS,
    );

    await notificationsPlugin.initialize(initSettings);
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      iOS: DarwinNotificationDetails(),
    );
  }

  // show notification
  Future<void> showNotification(
      {int id = 0, String? title, String? body}) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
    );
  }

  Future<void> scheduleDailyNotification({
    int id = 1,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    // Get the current date/time in device's local timezone
    final now = tz.TZDateTime.now(tz.local);

    // Crate a datae/time for today at the specified hour/min
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // Schedule notification
    await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      const NotificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

//   Future<void> scheduleDailyNotification(String message) async {
//     const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     const NotificationDetails notificationDetails =
//         NotificationDetails(iOS: iosDetails);

//     await notificationsPlugin.zonedSchedule(
//       0, // Notification ID
//       "Good Morning! 🌞", // Title
//       message, // Body
//       _nextInstanceOfTime(4, 0), // Schedule at 8 AM
//       notificationDetails,
//       androidScheduleMode: AndroidScheduleMode
//           .exactAllowWhileIdle, // ✅ Required for Android but ignored on iOS
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time, // Repeat every day
//     );
//   }

// // Helper Function to Schedule Notifications at a Specific Time
//   tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledTime =
//         tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
//     if (scheduledTime.isBefore(now)) {
//       scheduledTime = scheduledTime.add(const Duration(days: 1));
//     }
//     return scheduledTime;
//   }
}
