import 'package:flutter/material.dart';
import 'package:kamyogya_flutter_intern_task/routes/app_route_names.dart';
import 'package:kamyogya_flutter_intern_task/screens/fall_back_screen.dart';
import 'package:kamyogya_flutter_intern_task/screens/first_screen.dart';
import 'package:kamyogya_flutter_intern_task/screens/second_screen.dart';

class AppRoutConfig {
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.firstPage:
        return MaterialPageRoute(
          builder: (context) => const FirstScreen(),
        );
      case AppRouteNames.secondPage:
        return MaterialPageRoute(
          builder: (context) => const SecondScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const FallBackScreen(),
        );
    }
  }
}
