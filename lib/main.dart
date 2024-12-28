import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/core/dynamic_link/dynamic_link_handler.dart';
import 'package:ecoomerce_shop/core/firebase_api/firebase_api.dart';
import 'package:ecoomerce_shop/features/app/main_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator.configureDependencies();
    // await DynamicLinkHandler.instance.initialize();

  final navigatorKey = GlobalKey<NavigatorState>();
  final dynamicLinkHandler = DynamicLinkHandler(navigatorKey);
  await Firebase.initializeApp();
  await FirebaseApi(navigatorKey: navigatorKey).initNotifications();

  // Ensure dynamic link handler is initialized
  dynamicLinkHandler.initialize();

  runApp(MainApp(navigatorKey: navigatorKey));

  // runApp( MainApp());
}


