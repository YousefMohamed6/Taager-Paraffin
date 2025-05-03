import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/email_form_field.dart';
import 'package:tager_paraffin/features/auth/rest_Password/rest_password_cubit/rest_password_cubit.dart';

class RestPaswordEmailFeild extends StatelessWidget {
  const RestPaswordEmailFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return EmailFormFeild(
      email: BlocProvider.of<RestPasswordCubit>(context).email,
    );
  }
}
