//import 'dart:ffi';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin notificationPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidFlutterLocalNotificationsPlugin
      androidFlutterLocalNotificationsPlugin =
      AndroidFlutterLocalNotificationsPlugin();
  Future<void> initNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("flutter_logo");
    androidFlutterLocalNotificationsPlugin.requestExactAlarmsPermission();
    var initializationSettingsIos = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );

    var initializationSettings = InitializationSettings(
        iOS: initializationSettingsIos, android: androidInitializationSettings);
    await notificationPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    return notificationPlugin.show(id, title, body, notificationDetails());
  }
}
