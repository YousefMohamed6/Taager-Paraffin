import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/styles_manager.dart';
import 'package:tager_paraffin/features/auth/register/register_cubit/register_cubit.dart';
import 'package:tager_paraffin/features/auth/register/view/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "/register";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.register,
              style: StyleManager.textStyle24),
          centerTitle: true,
          backgroundColor: ColorsManager.primaryColor,
        ),
        body: const RegisterViewBody(),
      ),
    );
  }
}
