import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


Future<void> handleBackgroundMessage(RemoteMessage message) async{
  print('Title : ${message.notification!.title}');
    print('Body  : ${message.notification!.body}');

  print('Payload : ${message.data}');


}


class FirebaseApi {
    final GlobalKey<NavigatorState> navigatorKey;
    FirebaseApi({required this.navigatorKey});
 
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async{
    await firebaseMessaging.requestPermission();
    final FCMToken = await firebaseMessaging.getToken();
    print("Token:  $FCMToken");

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  }
}
