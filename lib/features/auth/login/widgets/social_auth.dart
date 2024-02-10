import 'package:flutter/material.dart';
import 'package:tager_paraffin/features/auth/login/widgets/login_with_facebook_button.dart';
import 'package:tager_paraffin/features/auth/login/widgets/login_with_google_button.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [LoginWithFacebookButton(), LoginWithGoogleButton()],
    );
  }
}
