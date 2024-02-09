import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/core/widgets/app_logo.dart';
import 'package:tager_paraffin/core/widgets/email_text.dart';
import 'package:tager_paraffin/features/auth/forget_Password/forget_password_cubit/forget_password_cubit.dart';
import 'package:tager_paraffin/features/auth/forget_Password/widgets/forget_password_button.dart';
import 'package:tager_paraffin/features/auth/forget_Password/widgets/forget_password_email_feild.dart';

class ForgetPasswodBody extends StatelessWidget {
  const ForgetPasswodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<ForgetPasswordCubit>(context).formKey,
      child: ListView(
        children: const [
          AppLogo(),
          EmailText(),
          SizedBox(height: ValuesManager.sizedBoxHeight8),
          ForgetPaswordEmailFeild(),
          SizedBox(height: ValuesManager.sizedBoxHeight24),
          RestPasswordButton(),
        ],
      ),
    );
  }
}
