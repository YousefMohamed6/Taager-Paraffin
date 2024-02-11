import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/colors_manager.dart';
import 'package:tager_paraffin/core/uitls/styles_manager.dart';
import 'package:tager_paraffin/features/auth/rest_Password/rest_password_cubit/rest_password_cubit.dart';
import 'package:tager_paraffin/features/auth/rest_Password/view/rest_password_view_body.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});
  static const String routeName = "/Restpassword";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestPasswordCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).restPassword,
            style: StyleManager.textStyle24,
          ),
          centerTitle: true,
          backgroundColor: ColorManager.primary,
        ),
        body: const RestPasswodBody(),
      ),
    );
  }
}
