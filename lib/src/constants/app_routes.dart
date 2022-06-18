import 'package:flutter/material.dart';
import 'package:grab_games/src/presentation/home_screen/home_screen.dart';
import 'package:grab_games/src/presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> getRoutes(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case SplashScreen.routeName:
            return const SplashScreen();

          case HomeScreen.routeName:
            return const HomeScreen();

          default:
            return const SplashScreen();
        }
      },
    );
  }
}
