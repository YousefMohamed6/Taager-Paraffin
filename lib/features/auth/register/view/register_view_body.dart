import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';
import 'package:tager_paraffin/core/uitls/show_message.dart';
import 'package:tager_paraffin/core/widgets/app_logo.dart';
import 'package:tager_paraffin/core/widgets/email_text.dart';
import 'package:tager_paraffin/core/widgets/password_text.dart';
import 'package:tager_paraffin/features/auth/register/register_cubit/register_cubit.dart';
import 'package:tager_paraffin/features/auth/register/widgets/name_text.dart';
import 'package:tager_paraffin/features/auth/register/widgets/phone_text.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_button.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_email_feild.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_name_field.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_password_feild.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_phone_field.dart';
import 'package:tager_paraffin/features/auth/register/widgets/register_row.dart';

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
          ShowMessage.show(
              msg: AppLocalizations.of(context)!.verifyEmailMessage);
        }
      },
      child: SafeArea(
        child: Form(
          key: BlocProvider.of<RegisterCubit>(context).formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
            children: const [
              AppLogo(),
              EmailText(),
              SizedBox(height: ValuesManager.height8),
              RegsiterEmailField(),
              SizedBox(height: ValuesManager.height8),
              PhoneText(),
              SizedBox(height: ValuesManager.height8),
              RegsiterPhoneFeild(),
              SizedBox(height: ValuesManager.height8),
              NameText(),
              SizedBox(height: ValuesManager.height8),
              RegsiterNameFeild(),
              SizedBox(height: ValuesManager.height8),
              PasswordText(),
              SizedBox(height: ValuesManager.height8),
              RegsiterPasswordFeild(),
              SizedBox(height: ValuesManager.height24),
              RegisterButton(),
              SizedBox(height: ValuesManager.height8),
              RegisterRow(),
            ],
          ),
        ),
      ),
    );
  }
}
