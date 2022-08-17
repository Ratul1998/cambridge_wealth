import 'dart:convert';

import 'package:cambridge_wealth/models/notification_data.dart';
import 'package:flutter/services.dart';

class NotificationRepository {
  Future<List<NotificationData>> getNotifications() async {
    await Future.delayed(const Duration(seconds: 1));

    final String response =
        await rootBundle.loadString('assets/json/notifications.json');

    List<dynamic> data = jsonDecode(response);

    List<NotificationData> notifications = [];

    for (var element in data) {
      notifications.add(NotificationData.fromJson(element));
    }

    return notifications;
  }
}
