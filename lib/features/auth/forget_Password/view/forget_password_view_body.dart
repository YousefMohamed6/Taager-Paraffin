import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/show_message.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/core/widgets/app_logo.dart';
import 'package:tager_paraffin/core/widgets/email_text.dart';
import 'package:tager_paraffin/features/auth/forget_Password/forget_password_cubit/forget_password_cubit.dart';
import 'package:tager_paraffin/features/auth/forget_Password/widgets/forget_password_button.dart';
import 'package:tager_paraffin/features/auth/forget_Password/widgets/forget_password_email_feild.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class ForgetPasswodBody extends StatelessWidget {
  const ForgetPasswodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordFailure) {
          String errorMessage =
              BlocProvider.of<ForgetPasswordCubit>(context).handleErrorMessage(
            exceptionMessage: state.exceptionMessage,
            context: context,
          );
          ShowMessage.show(msg: errorMessage);
        }
        if (state is ForgetPasswordSucess) {
          Navigator.pop(context);
          ShowMessage.show(msg: S.of(context).restEmailMessage);
        }
      },
      child: Form(
        key: BlocProvider.of<ForgetPasswordCubit>(context).formKey,
        child: ListView(
          children: const [
            AppLogo(),
            EmailText(),
            SizedBox(height: ValuesManager.height8),
            ForgetPaswordEmailFeild(),
            SizedBox(height: ValuesManager.height24),
            RestPasswordButton(),
          ],
        ),
      ),
    );
  }
}
