import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


Future<void> handleBackgroundMessage(RemoteMessage message) async{
  print('Title : ${message.notification!.title}');
    print('Body  : ${message.notification!.body}');

  print('Payload : ${message.data}');


}
 void handleMessage(RemoteMessage? message){
    if(message ==null){
      return;
    }
    // redirect screen
 }  
  Future initNotifications() async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
       badge: true,
       sound:true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
        FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  }

class FirebaseApi {
    final GlobalKey<NavigatorState> navigatorKey;
    FirebaseApi({required this.navigatorKey});
 
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async{
    await firebaseMessaging.requestPermission();
    final FCMToken = await firebaseMessaging.getToken();
    print("Token:  $FCMToken");
    initNotifications();

  }
}
