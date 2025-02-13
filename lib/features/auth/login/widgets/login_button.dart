import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/custom_button.dart';
import 'package:tager_paraffin/core/widgets/loading_indcator.dart';
import 'package:tager_paraffin/features/auth/login/login_cubit/login_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return const LoadingIndictor();
        } else {
          return Column(
            children: [
              CustomButton(
                text: AppLocalizations.of(context)!.login,
                onPressed: () {
                  var formKey = BlocProvider.of<LoginCubit>(context).formKey;
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<LoginCubit>(context)
                        .signInWithEmailAndPassword();
                  }
                },
              ),
            ],
          );
        }
      },
    );
  }
}
