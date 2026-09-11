import 'package:cinemapedia/config/router/routes.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: Routes.home,
  routes:[
    GoRoute(
      path: Routes.home,
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
  ]
  );
