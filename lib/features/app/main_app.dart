import 'package:ecoomerce_shop/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:ecoomerce_shop/core/dynamic_link/dynamic_link_handler.dart';

class MainApp extends StatelessWidget {
  // Declare your navigator key
  // static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> navigatorKey;

  const MainApp({super.key, required this.navigatorKey});
  @override
  Widget build(BuildContext context) {
    // Initialize DynamicLinkHandler with navigatorKey
    // DynamicLinkHandler(_navigatorKey);

    return MaterialApp.router(
      routerConfig: AppRouter().generateRouter(navigatorKey), // Pass _navigatorKey to AppRouter
    );
  }
}
