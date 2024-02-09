import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/custom_button.dart';
import 'package:tager_paraffin/features/auth/forget_Password/forget_password_cubit/forget_password_cubit.dart';
import 'package:tager_paraffin/generated/l10n.dart';
class RestPasswordButton extends StatelessWidget {
  const RestPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
            text: S.of(context).restPassword,
            onPressed: () {
              var formKey =
                  BlocProvider.of<ForgetPasswordCubit>(context).formKey;
              if (formKey.currentState!.validate()) {
                BlocProvider.of<ForgetPasswordCubit>(context).restPassword();
              }
            }),
      ],
    );
  }
}
