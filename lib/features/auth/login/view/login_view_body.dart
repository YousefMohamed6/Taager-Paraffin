import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/show_message.dart';
import 'package:tager_paraffin/core/uitls/styles_manager.dart';
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
import 'package:tager_paraffin/features/auth/login/widgets/social_auth.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ShowMessage.show(msg: state.errorMessage);
        }
        if (state is LoginSucess) {
          ShowMessage.show(msg: S.of(context).login);
        }
      },
      child: SafeArea(
        child: Form(
          key: BlocProvider.of<LoginCubit>(context).formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
            children: const [
              AppLogo(),
              EmailText(),
              SizedBox(height: ValuesManager.height8),
              LoginEmailFeild(),
              SizedBox(height: ValuesManager.height16),
              PasswordText(),
              SizedBox(height: ValuesManager.height8),
              LoginPasswordFeild(),
              ForgetPasswordTextButton(),
              SizedBox(height: ValuesManager.height24),
              LoginButton(),
              SizedBox(height: ValuesManager.height24),
              Text(
                "or",
                textAlign: TextAlign.center,
                style: StyleManager.textStyle20,
              ),
              SocialAuth(),
              SizedBox(height: ValuesManager.height24),
              LoginRow(),
            ],
          ),
        ),
      ),
    );
  }
}
