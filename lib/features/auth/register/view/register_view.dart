<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/features/auth/register/view/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "/register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register,
            style: StyleManager.textStyle24),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: const RegisterViewBody(),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/features/auth/register/view/register_view_body.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "/register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register,
            style: StyleManager.textStyle24),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: const RegisterViewBody(),
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
