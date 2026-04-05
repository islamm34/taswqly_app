import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taswqly/core/routing/routes.dart';

import '../../features/auth/ui/screens/login/login.dart';
import '../../features/commerce/ui/screens/navigation_layout/navigation_view.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigating to: ${settings.name}');
    }

    final uri = Uri.parse(settings.name ?? '/');

    switch (uri.path) {
      case Routes.navigationRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavigationView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>  Login(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
