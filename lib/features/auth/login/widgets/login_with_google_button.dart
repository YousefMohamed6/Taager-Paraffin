import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/assets_manager.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';
import 'package:tager_paraffin/features/auth/login/login_cubit/login_cubit.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await BlocProvider.of<LoginCubit>(context).signInWithGoogle();
      },
      icon: const Image(
        height: ValuesManager.authIconSize,
        image: AssetImage(AssetsManager.googleLogo),
      ),
    );
  }
}
