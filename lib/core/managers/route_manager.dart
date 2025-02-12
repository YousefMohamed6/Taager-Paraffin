import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/features/auth/login/login_cubit/login_cubit.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view.dart';
import 'package:tager_paraffin/features/auth/register/register_cubit/register_cubit.dart';
import 'package:tager_paraffin/features/auth/register/view/register_view.dart';
import 'package:tager_paraffin/features/auth/rest_Password/rest_password_cubit/rest_password_cubit.dart';
import 'package:tager_paraffin/features/auth/rest_Password/view/rest_password_view.dart';
import 'package:tager_paraffin/features/maps/presentation/manager/maps_cubit.dart';
import 'package:tager_paraffin/features/maps/presentation/views/maps_view.dart';
import 'package:tager_paraffin/features/onboard/pressentation/manager/on_board_cubit.dart';
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
          return BlocProvider(
            create: (context) => OnBoardCubit(),
            child: const OnBoardView(),
          );
        },
      ),
      GoRoute(
        path: LoginView.routeName,
        name: LoginView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RegisterView.routeName,
        name: RegisterView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: RestPasswordView.routeName,
        name: RestPasswordView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => RestPasswordCubit(),
          child: const RestPasswordView(),
        ),
      ),
      GoRoute(
        path: MapsScreen.routeName,
        name: MapsScreen.routeName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => MapsCubit(),
            child: const MapsScreen(),
          );
        },
      ),
    ],
  );
}
