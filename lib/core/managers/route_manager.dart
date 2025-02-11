import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view.dart';
import 'package:tager_paraffin/features/auth/register/view/register_view.dart';
import 'package:tager_paraffin/features/auth/rest_Password/view/rest_password_view.dart';
import 'package:tager_paraffin/features/maps/di/map_service.dart';
import 'package:tager_paraffin/features/maps/presentation/views/maps_view.dart';
import 'package:tager_paraffin/features/onboard/pressentation/views/onboard_view.dart';
import 'package:tager_paraffin/features/splash/view/splash_view.dart';

abstract class RouteManager {
  static GoRouter routConfig = GoRouter(
    initialLocation: SplashView.routeName,
    routes: [
      GoRoute(
        path: SplashView.routeName,
        name: SplashView.routeName,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: OnBoardView.routeName,
        name: OnBoardView.routeName,
        builder: (context, state) {
          MapsService().init();
          return const OnBoardView();
        },
      ),
      GoRoute(
        path: LoginView.routeName,
        name: LoginView.routeName,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: RegisterView.routeName,
        name: RegisterView.routeName,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: RestPasswordView.routeName,
        name: RestPasswordView.routeName,
        builder: (context, state) => const RestPasswordView(),
      ),
      GoRoute(
        path: MapScreen.routeName,
        name: MapScreen.routeName,
        builder: (context, state) {
          MapsService().init();
          return const MapScreen();
        },
      ),
    ],
  );
}
