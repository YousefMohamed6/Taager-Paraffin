import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/core/widgets/app_logo.dart';
import 'package:tager_paraffin/core/widgets/email_text.dart';
import 'package:tager_paraffin/core/widgets/password_text.dart';
import 'package:tager_paraffin/features/auth/login/login_cubit/login_cubit.dart';
import 'package:tager_paraffin/features/auth/login/widgets/forget_password_textbutton.dart';
import 'package:tager_paraffin/features/auth/login/widgets/login_button.dart';
import 'package:tager_paraffin/features/auth/login/widgets/login_email_feild.dart';
import 'package:tager_paraffin/features/auth/login/widgets/login_password_feild.dart';
import 'package:tager_paraffin/features/auth/login/widgets/login_row.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: BlocProvider.of<LoginCubit>(context).formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
          children: const [
            AppLogo(),
            EmailText(),
            SizedBox(height: ValuesManager.sizedBoxHeight8),
            LoginEmailFeild(),
            SizedBox(height: ValuesManager.sizedBoxHeight16),
            PasswordText(),
            SizedBox(height: ValuesManager.sizedBoxHeight8),
            LoginPasswordFeild(),
            ForgetPasswordTextButton(),
            SizedBox(height: ValuesManager.sizedBoxHeight32),
            LoginButton(),
            SizedBox(height: ValuesManager.sizedBoxHeight48),
            LoginRow(),
          ],
        ),
      ),
    );
  }
}
