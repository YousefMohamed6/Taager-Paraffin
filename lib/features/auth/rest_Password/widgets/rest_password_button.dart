import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/custom_button.dart';
import 'package:tager_paraffin/core/widgets/loading_indcator.dart';
import 'package:tager_paraffin/features/auth/rest_Password/rest_password_cubit/rest_password_cubit.dart';
import 'package:tager_paraffin/generated/l10n.dart';

class RestPasswordButton extends StatelessWidget {
  const RestPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestPasswordCubit, RestPasswordState>(
      builder: (context, state) {
        if (state is RestPasswordLoading) {
          return const LoadingIndictor();
        } else {
          return Column(
            children: [
              CustomButton(
                  text: S.of(context).send,
                  onPressed: () async {
                    var formKey =
                        BlocProvider.of<RestPasswordCubit>(context).formKey;
                    if (formKey.currentState!.validate()) {
                      await BlocProvider.of<RestPasswordCubit>(context)
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
