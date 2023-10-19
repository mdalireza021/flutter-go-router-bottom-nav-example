import 'package:flutter/material.dart';
import 'package:flutter_go_router_bottom_nav_example/router/routes_names.dart';
import 'package:go_router/go_router.dart';
import 'app_router.dart';

/// Extension on [BuildContext] to simplify navigation
extension RouterContextExtension on BuildContext {
  void backToPreviousPage() {
    GoRouter.of(this).pop();
  }

  void popUntil(String routeName) {
    if (!AppRouter.backStack.contains(routeName)) {
      return;
    }
    while (AppRouter.backStack.last != routeName) {
      GoRouter.of(this).pop();
    }
  }

  void replaceHome({
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
  }) {
    GoRouter.of(this).pushReplacementNamed(
      RouteNames.bottomNav,
      extra: extra,
    );
  }
}
