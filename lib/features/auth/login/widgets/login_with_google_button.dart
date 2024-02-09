import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/features/auth/login/login_cubit/login_cubit.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<LoginCubit>(context).signInWithGoogle();
      },
      icon: const Icon(
        FontAwesomeIcons.google,
        size: ValuesManager.googleIconSize,
      ),
    );
  }
}
