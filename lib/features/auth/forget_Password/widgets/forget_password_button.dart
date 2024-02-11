import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/custom_button.dart';
import 'package:tager_paraffin/core/widgets/loading_indcator.dart';
import 'package:tager_paraffin/features/auth/forget_Password/forget_password_cubit/forget_password_cubit.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class RestPasswordButton extends StatelessWidget {
  const RestPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        if (state is ForgetPasswordLoading) {
          return const LoadingIndictor();
        } else {
          return Column(
            children: [
              CustomButton(
                  text: S.of(context).restPassword,
                  onPressed: () async {
                    var formKey =
                        BlocProvider.of<ForgetPasswordCubit>(context).formKey;
                    if (formKey.currentState!.validate()) {
                      await BlocProvider.of<ForgetPasswordCubit>(context)
                          .restPassword();
                    }
                  }),
            ],
          );
        }
      },
    );
  }
}
