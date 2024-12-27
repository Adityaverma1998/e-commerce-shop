import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';

/// Provides methods to manage dynamic links.
class DynamicLinkHandler {
  final GlobalKey<NavigatorState> navigatorKey;
  final _appLinks = AppLinks();

  DynamicLinkHandler(this.navigatorKey);

  /// Initializes the [DynamicLinkHandler].
  Future<void> initialize() async {
    // Listens to the dynamic links and manages navigation.
    _appLinks.uriLinkStream.listen((Uri data) {
      _handleLinkData(data); // Removed context, we will get it from the navigator
    }).onError((error) {
      log('$error', name: 'Dynamic Link Handler');
    });
    await _checkInitialLink();
  }

  /// Handle navigation if initial link is found on app start.
  Future<void> _checkInitialLink() async {
    final initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
  _handleLinkData(initialLink);     }
  }

  /// Handles the link navigation for Dynamic Links.
  void _handleLinkData(Uri data) {
    final path = data.pathSegments;
    log("Deep link data received: $data", name: 'Dynamic Link Handler');

    if (path.isNotEmpty && path[0] == 'productDetails') {
      final productId = path[1];
      log("Navigating to product details with ID: $productId", name: 'Dynamic Link Handler');
      // We get the context from the navigatorKey
      final context = navigatorKey.currentState?.context;
      if (context != null) {
        GoRouter.of(context).push('/productDetails/$productId');
      }
    }
  }

  /// Navigate to product details page using GoRouter.
  void _navigateToProductDetails(String productId) {
    final context = navigatorKey.currentState?.context;

    // Ensure the context is valid
    if (context != null) {
      GoRouter.of(context).push('/productDetails/$productId');
    }
  }

  /// Provides the short URL for your dynamic link.
  Future<String> createProductLink({
    required int id,
    required String title,
  }) async {
    // Call Rest API if link needs to be generated from backend.
    return 'https://example.com/products?id=$id&title=$title';
  }
}
