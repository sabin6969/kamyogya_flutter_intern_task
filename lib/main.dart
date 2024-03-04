import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamyogya_flutter_intern_task/data/repository/api_repository.dart';
import 'package:kamyogya_flutter_intern_task/data/services/api_services.dart';
import 'package:kamyogya_flutter_intern_task/notifications/local_notifications.dart';
import 'package:kamyogya_flutter_intern_task/permissions/notification_permissions.dart';
import 'package:kamyogya_flutter_intern_task/routes/app_route_config.dart';
import 'package:kamyogya_flutter_intern_task/themes/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

// Creating global object for accessing height and width of screen
late Size size;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await LocalNotification.init();
  await dotenv.load(fileName: ".env");
  NotificationPermission.askForNotificationPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ApiRepository(
        apiServices: ApiServices(),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Kamyogya flutter intern task',
        theme: AppTheme.defaultTheme,
        routerConfig: AppRoutConfig().goRouter,
      ),
    );
  }
}
