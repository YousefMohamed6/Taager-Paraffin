import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: BlocProvider.of<RegisterCubit>(context).formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
          children: const [
            AppLogo(),
            NameText(),
            SizedBox(height: ValuesManager.sizedBoxHeight8),
            RegsiterNameFeild(),
            SizedBox(height: ValuesManager.sizedBoxHeight16),
            EmailText(),
            SizedBox(height: ValuesManager.sizedBoxHeight8),
            RegsiterEmailField(),
            SizedBox(height: ValuesManager.sizedBoxHeight16),
            PasswordText(),
            SizedBox(height: ValuesManager.sizedBoxHeight8),
            RegsiterPasswordFeild(),
            SizedBox(height: ValuesManager.sizedBoxHeight48),
            RegisterButton(),
            SizedBox(height: ValuesManager.sizedBoxHeight24),
            RegisterRow(),
          ],
        ),
      ),
    );
  }
}
