import 'package:clean_architecture_with_bloc/app/navigation/app_route.dart';
import 'package:clean_architecture_with_bloc/app/ui/screens/main/main_screen.dart';
import 'package:clean_architecture_with_bloc/app/ui/screens/main/main_screen_view_model.dart';
import 'package:clean_architecture_with_bloc/app/ui/screens/splahs/splash_screen.dart';
import 'package:clean_architecture_with_bloc/app/ui/screens/splahs/splash_screen_view_model.dart';
import 'package:go_router/go_router.dart';

class AppRouterConfig {
  late final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: AppRoute.root,
  );

  void dispose() {
    router.dispose();
  }

  late final _routes = <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.root,
      builder: (context, state) => SplashScreen(
        viewModel: SplashScreenViewModel(),
      ),
    ),
    GoRoute(
      path: '/main',
      name: AppRoute.main,
      builder: (context, state) => MainScreen(
        viewModel: MainScreenViewModel(),
      ),
    ),
  ];
}
