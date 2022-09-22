// import 'dart:math';

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// class CcLockalNotification {
//   static void initialize() {
//     AwesomeNotifications().initialize(
//       'resource://drawable/res_app_icon',
//       [
//         NotificationChannel(
//           channelGroupKey: 'basic',
//           channelKey: 'basic_channel',
//           channelName: 'Capar notifications',
//           channelDescription: 'Notification channel for Capar app',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//           importance: NotificationImportance.High,
//           channelShowBadge: true,
//           locked: true,
//           defaultRingtoneType: DefaultRingtoneType.Notification,
//           vibrationPattern: lowVibrationPattern,
//         ),
//       ],
//       channelGroups: [
//         NotificationChannelGroup(
//             channelGroupkey: 'basic', channelGroupName: 'Basic'),
//       ],
//       debug: true,
//     );
//   }

//   static void display(RemoteMessage message) async {
//     try {
//       if (!AwesomeStringUtils.isNullOrEmpty(message.notification?.title,
//               considerWhiteSpaceAsEmpty: true) ||
//           !AwesomeStringUtils.isNullOrEmpty(message.notification?.body,
//               considerWhiteSpaceAsEmpty: true)) {
//         print('message also contained a notification: ${message.notification}');

//         String? imageUrl;
//         imageUrl ??= message.notification!.android?.imageUrl;
//         imageUrl ??= message.notification!.apple?.imageUrl;

//         Map<String, dynamic> notificationAdapter = {
//           NOTIFICATION_CHANNEL_KEY: 'basic_channel',
//           NOTIFICATION_ID: message.data[NOTIFICATION_CONTENT]
//                   ?[NOTIFICATION_ID] ??
//               message.messageId ??
//               Random().nextInt(2147483647),
//           NOTIFICATION_TITLE: message.data[NOTIFICATION_CONTENT]
//                   ?[NOTIFICATION_TITLE] ??
//               message.notification?.title,
//           NOTIFICATION_BODY: message.data[NOTIFICATION_CONTENT]
//                   ?[NOTIFICATION_BODY] ??
//               message.notification?.body,
//           NOTIFICATION_LAYOUT: AwesomeStringUtils.isNullOrEmpty(imageUrl)
//               ? 'Default'
//               : 'BigPicture',
//           NOTIFICATION_BIG_PICTURE: imageUrl
//         };
//         var id = notificationAdapter[NOTIFICATION_ID]
//             .toString()
//             .substring(2)
//             .split("%")
//             .first;
//         AwesomeNotifications().createNotification(
//             content: NotificationContent(
//           id: int.tryParse(id) ?? Random().nextInt(2147483647),
//           channelKey: notificationAdapter[NOTIFICATION_CHANNEL_KEY],
//           title: notificationAdapter[NOTIFICATION_TITLE],
//           body: notificationAdapter[NOTIFICATION_BODY],
//           bigPicture: notificationAdapter[NOTIFICATION_BIG_PICTURE],
//         ));
//       } else {
//         AwesomeNotifications().createNotificationFromJsonData(message.data);
//       }
//     } catch (e) {
//       print('display - - $e');
//     }
//   }
// }
