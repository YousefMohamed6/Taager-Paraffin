import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view.dart';
import 'package:tager_paraffin/features/splash/widgets/animated_view.dart';
import 'package:tager_paraffin/features/splash/widgets/app_title.dart';
import 'package:tager_paraffin/features/splash/widgets/splash_logo.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.goNamed(LoginView.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTitle(),
        SizedBox(height: ValuesManager.height16),
        SplashLogo(),
        AnimatedView(),
      ],
    );
  }
}
