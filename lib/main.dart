import 'package:flutter/material.dart';
import 'package:kamyogya_flutter_intern_task/routes/app_route_config.dart';
import 'package:kamyogya_flutter_intern_task/themes/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Creating global object for accessing height and width of screen
late Size size;

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kamyogya flutter intern task',
      theme: AppTheme.defaultTheme,
      onGenerateRoute: AppRoutConfig.generateRoutes,
    );
  }
}
