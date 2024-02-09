import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/colors_manager.dart';
import 'package:tager_paraffin/core/uitls/styles_manager.dart';
import 'package:tager_paraffin/features/auth/forget_Password/forget_password_cubit/forget_password_cubit.dart';
import 'package:tager_paraffin/features/auth/forget_Password/view/forget_password_view_body.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = "/forgetpassword";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).forgetPassword,
              style: StyleManager.textStyle24),
          centerTitle: true,
          backgroundColor: ColorManager.primary,
        ),
        body: const ForgetPasswodBody(),
      ),
    );
  }
}
