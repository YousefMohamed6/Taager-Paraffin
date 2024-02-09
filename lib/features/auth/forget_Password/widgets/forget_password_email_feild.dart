import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/email_form_field.dart';
import 'package:tager_paraffin/features/auth/forget_Password/forget_password_cubit/forget_password_cubit.dart';

class ForgetPaswordEmailFeild extends StatelessWidget {
  const ForgetPaswordEmailFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return EmailFormFeild(
      email: BlocProvider.of<ForgetPasswordCubit>(context).email,
    );
  }
}
