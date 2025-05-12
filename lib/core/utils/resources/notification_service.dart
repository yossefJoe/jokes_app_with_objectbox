import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:figner_print_auth/core/utils/resources/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class NotificationService {
  static onNotificationTapped(NotificationResponse response) async {
    log("Notification tapped");
    log(response.payload.toString());
  }
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  final dio = Dio();
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse:
          NotificationService.onNotificationTapped,
      onDidReceiveBackgroundNotificationResponse:
          NotificationService.onNotificationTapped);
  Timer.periodic(const Duration(minutes: 1), (timer) async {
    try {
      final response = await dio.get("https://v2.jokeapi.dev/joke/Any");
      final data = response.data;

      String title = "Here's a joke!";
      String body = '';

      if (data['type'] == 'single') {
        body = data['joke'];
      } else {
        body = "${data['setup']}\n${data['delivery']}";
      }

      await flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'joke_channel',
            'Joke Notifications',
            importance: Importance.high,
            priority: Priority.high,
            playSound: true,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    } catch (e) {
      print("Error fetching joke: $e");
    }
  });
}
