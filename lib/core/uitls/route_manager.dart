import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/features/auth/forget_Password/view/forget_password_view.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view.dart';
import 'package:tager_paraffin/features/auth/register/view/register_view.dart';
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
        path: ForgetPasswordView.routeName,
        name: ForgetPasswordView.routeName,
        builder: (context, state) => const ForgetPasswordView(),
      ),
    ],
  );
}
