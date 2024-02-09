import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/password_form_feild.dart';
import 'package:tager_paraffin/features/auth/login/login_cubit/login_cubit.dart';

class LoginPasswordFeild extends StatelessWidget {
  const LoginPasswordFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return PasswordFormFeild(
          password: BlocProvider.of<LoginCubit>(context).password,
          obsecureText: BlocProvider.of<LoginCubit>(context).obSecureText,
          onVisablePressed: () {
            BlocProvider.of<LoginCubit>(context).visablePassword();
          },
        );
      },
    );
  }
}
