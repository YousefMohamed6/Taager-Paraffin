<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login,
            style: StyleManager.textStyle24),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: const LoginViewBody(),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view_body.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login,
            style: StyleManager.textStyle24),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: const LoginViewBody(),
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
