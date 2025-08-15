import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/widgets/email_form_field.dart';
import 'package:tager_paraffin/features/auth/register/register_cubit/register_cubit.dart';

class RegsiterEmailField extends StatelessWidget {
  const RegsiterEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return EmailFormFeild(email: BlocProvider.of<RegisterCubit>(context).email);
  }
}
