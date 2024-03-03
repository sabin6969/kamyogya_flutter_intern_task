import 'package:go_router/go_router.dart';
import 'package:kamyogya_flutter_intern_task/data/models/members_model.dart';
import 'package:kamyogya_flutter_intern_task/routes/app_route_names.dart';
import 'package:kamyogya_flutter_intern_task/screens/fall_back_screen.dart';
import 'package:kamyogya_flutter_intern_task/screens/first_screen.dart';
import 'package:kamyogya_flutter_intern_task/screens/second_screen.dart';

class AppRoutConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: "/",
    errorBuilder: (context, state) {
      return const FallBackScreen();
    },
    routes: [
      GoRoute(
        path: AppRouteNames.firstPage,
        name: "home",
        builder: (context, state) {
          return const FirstScreen();
        },
      ),
      GoRoute(
        path: "/${AppRouteNames.secondPage}",
        name: "secondPage",
        builder: (context, state) {
          return SecondScreen(
            members: state.extra as List<MembersModel>,
          );
        },
      ),
    ],
  );
}
