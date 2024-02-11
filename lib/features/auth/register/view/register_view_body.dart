import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/show_message.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/core/widgets/app_logo.dart';
import 'package:tager_paraffin/core/widgets/email_text.dart';
import 'package:tager_paraffin/core/widgets/name_text.dart';
import 'package:tager_paraffin/core/widgets/password_text.dart';
import 'package:tager_paraffin/features/auth/register/register_cubit/register_cubit.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_button.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_email_feild.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_name_field.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_password_feild.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_row.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          String errorMessage =
              BlocProvider.of<RegisterCubit>(context).handleErrorMessage(
            exceptionMessage: state.exceptionMessage,
            context: context,
          );
          ShowMessage.show(msg: errorMessage);
        }
        if (state is RegisterSucess) {
          Navigator.pop(context);
          ShowMessage.show(msg: S.of(context).verifyEmailMessage);
        }
      },
      child: SafeArea(
        child: Form(
          key: BlocProvider.of<RegisterCubit>(context).formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
            children: const [
              SizedBox(height: ValuesManager.height8),
              AppLogo(),
              NameText(),
              SizedBox(height: ValuesManager.height8),
              RegsiterNameFeild(),
              SizedBox(height: ValuesManager.height16),
              EmailText(),
              SizedBox(height: ValuesManager.height8),
              RegsiterEmailField(),
              SizedBox(height: ValuesManager.height16),
              PasswordText(),
              SizedBox(height: ValuesManager.height8),
              RegsiterPasswordFeild(),
              SizedBox(height: ValuesManager.height48),
              RegisterButton(),
              SizedBox(height: ValuesManager.height24),
              RegisterRow(),
            ],
          ),
        ),
      ),
    );
  }
}
