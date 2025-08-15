<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/features/auth/rest_Password/view/rest_password_view_body.dart';

class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});
  static const String routeName = "/Restpassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.restPassword,
          style: StyleManager.textStyle24,
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: const RestPasswodBody(),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/features/auth/rest_Password/view/rest_password_view_body.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});
  static const String routeName = "/Restpassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.restPassword,
          style: StyleManager.textStyle24,
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: const RestPasswodBody(),
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
