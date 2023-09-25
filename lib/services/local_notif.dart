import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static Future init(FlutterLocalNotificationsPlugin localNotifPlugin) async {
    var andInit = const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings initSettingsDarwin =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: (int id, String? title, String? body,
                String? payload) async {});

    var initSettings = InitializationSettings(
      android: andInit,
      iOS: initSettingsDarwin,
    );

    await localNotifPlugin.initialize(initSettings);
  }

  static Future showNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'rckdu_notification',
      'chanel_name',
      playSound: true,
      importance: Importance.high,
      priority: Priority.high,
    );

    const DarwinNotificationDetails darwinNot = DarwinNotificationDetails();

    var not = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNot,
    );

    await flutterLocalNotificationsPlugin.show(0, title, body, not);
  }
}
