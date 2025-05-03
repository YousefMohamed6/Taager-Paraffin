import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';
import 'package:tager_paraffin/features/auth/login/login_cubit/login_cubit.dart';

class LoginWithFacebookButton extends StatelessWidget {
  const LoginWithFacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await BlocProvider.of<LoginCubit>(context).signInWithFacebook();
      },
      icon: const Icon(
        FontAwesomeIcons.facebook,
        size: ValuesManager.authIconSize,
        color: ColorsManager.facebookColor,
      ),
    );
  }
}
