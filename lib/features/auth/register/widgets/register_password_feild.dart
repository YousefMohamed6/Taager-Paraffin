import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/password_form_feild.dart';
import 'package:tager_paraffin/features/auth/register/register_cubit/register_cubit.dart';

class RegsiterPasswordFeild extends StatelessWidget {
  const RegsiterPasswordFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return PasswordFormFeild(
          password: BlocProvider.of<RegisterCubit>(context).password,
          obsecureText: BlocProvider.of<RegisterCubit>(context).obSecureText,
          onVisablePressed: () {
            BlocProvider.of<RegisterCubit>(context).visablePassword();
          },
        );
      },
    );
  }
}
