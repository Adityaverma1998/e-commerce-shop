import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/core/dynamic_link/dynamic_link_handler.dart';
import 'package:ecoomerce_shop/features/app/main_app.dart';
import 'package:flutter/material.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator.configureDependencies();
    // await DynamicLinkHandler.instance.initialize();

  final navigatorKey = GlobalKey<NavigatorState>();
  final dynamicLinkHandler = DynamicLinkHandler(navigatorKey);

  // Ensure dynamic link handler is initialized
  dynamicLinkHandler.initialize();

  runApp(MainApp(navigatorKey: navigatorKey));

  // runApp( MainApp());
}


