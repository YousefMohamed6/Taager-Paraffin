import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/core/managers/keys_manager.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';
import 'package:tager_paraffin/core/services/secure_storage_service.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view.dart';
import 'package:tager_paraffin/features/language/pressentation/views/language_view.dart';
import 'package:tager_paraffin/features/maps/presentation/views/maps_view.dart';
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
      () async {
        final String? isFirst = await SecureStorageManager.storage
            .read(key: KeysManager.kIsFirstOpenApp);
        if (isFirst == null) {
          context.goNamed(LanguageView.routeName);
          return;
        }
        if (mounted) {
          final User? user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            context.goNamed(LoginView.routeName);
          } else {
            context.goNamed(MapsScreen.routeName);
          }
        }
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
