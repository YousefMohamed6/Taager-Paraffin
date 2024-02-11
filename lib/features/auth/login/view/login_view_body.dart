import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/show_message.dart';
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
import 'package:tager_paraffin/features/auth/login/widgets/or_text.dart';
import 'package:tager_paraffin/features/auth/login/widgets/social_auth.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          String errorMessage =
              BlocProvider.of<LoginCubit>(context).handelErrorMessage(
            exceptionMessage: state.exceptionMessage,
            context: context,
          );
          ShowMessage.show(msg: errorMessage);
        }
        if (state is LoginSucess) {
          ShowMessage.show(msg: S.of(context).loginSuccessMessage);
        }
      },
      child: SafeArea(
        child: Form(
          key: BlocProvider.of<LoginCubit>(context).formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
            children: const [
              SizedBox(height: ValuesManager.height8),
              AppLogo(),
              EmailText(),
              SizedBox(height: ValuesManager.height8),
              LoginEmailFeild(),
              SizedBox(height: ValuesManager.height16),
              PasswordText(),
              SizedBox(height: ValuesManager.height8),
              LoginPasswordFeild(),
              RestPasswordTextButton(),
              SizedBox(height: ValuesManager.height16),
              LoginButton(),
              SizedBox(height: ValuesManager.height16),
              ORText(),
              SocialAuth(),
              SizedBox(height: ValuesManager.height16),
              LoginRow(),
            ],
          ),
        ),
      ),
    );
  }
}
