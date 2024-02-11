import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/custom_button.dart';
import 'package:tager_paraffin/core/widgets/loading_indcator.dart';
import 'package:tager_paraffin/features/auth/register/register_cubit/register_cubit.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const LoadingIndictor();
        } else {
          return Column(
            children: [
              CustomButton(
                text: S.of(context).register,
                onPressed: () {
                  var formKey = BlocProvider.of<RegisterCubit>(context).formKey;
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<RegisterCubit>(context).register();
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
