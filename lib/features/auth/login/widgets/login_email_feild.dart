import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/email_form_field.dart';
import 'package:tager_paraffin/features/auth/login/login_cubit/login_cubit.dart';

class LoginEmailFeild extends StatelessWidget {
  const LoginEmailFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return EmailFormFeild(
      email: BlocProvider.of<LoginCubit>(context).email,
    );
  }
}
