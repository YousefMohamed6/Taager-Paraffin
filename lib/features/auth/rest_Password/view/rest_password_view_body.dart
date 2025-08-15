<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';
import 'package:tager_paraffin/core/uitls/show_message.dart';
import 'package:tager_paraffin/core/widgets/app_logo.dart';
import 'package:tager_paraffin/core/widgets/email_text.dart';
import 'package:tager_paraffin/features/auth/Rest_Password/widgets/Rest_password_button.dart';
import 'package:tager_paraffin/features/auth/rest_Password/rest_password_cubit/rest_password_cubit.dart';
import 'package:tager_paraffin/features/auth/rest_Password/widgets/rest_password_email_feild.dart';

class RestPasswodBody extends StatelessWidget {
  const RestPasswodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RestPasswordCubit, RestPasswordState>(
      listener: (context, state) {
        if (state is RestPasswordFailure) {
          String errorMessage =
              BlocProvider.of<RestPasswordCubit>(context).handleErrorMessage(
            exceptionMessage: state.exceptionMessage,
            context: context,
          );
          ShowMessage.show(msg: errorMessage);
        }
        if (state is RestPasswordSucess) {
          Navigator.pop(context);
          ShowMessage.show(msg: AppLocalizations.of(context)!.restEmailMessage);
        }
      },
      child: Form(
        key: BlocProvider.of<RestPasswordCubit>(context).formKey,
        child: ListView(
          children: const [
            AppLogo(),
            EmailText(),
            SizedBox(height: ValuesManager.height8),
            RestPaswordEmailFeild(),
            SizedBox(height: ValuesManager.height24),
            RestPasswordButton(),
          ],
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';
import 'package:tager_paraffin/core/uitls/show_message.dart';
import 'package:tager_paraffin/core/widgets/app_logo.dart';
import 'package:tager_paraffin/core/widgets/email_text.dart';
import 'package:tager_paraffin/features/auth/Rest_Password/widgets/Rest_password_button.dart';
import 'package:tager_paraffin/features/auth/rest_Password/rest_password_cubit/rest_password_cubit.dart';
import 'package:tager_paraffin/features/auth/rest_Password/widgets/rest_password_email_feild.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class RestPasswodBody extends StatelessWidget {
  const RestPasswodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RestPasswordCubit, RestPasswordState>(
      listener: (context, state) {
        if (state is RestPasswordFailure) {
          String errorMessage =
              BlocProvider.of<RestPasswordCubit>(context).handleErrorMessage(
            exceptionMessage: state.exceptionMessage,
            context: context,
          );
          ShowMessage.show(msg: errorMessage);
        }
        if (state is RestPasswordSucess) {
          Navigator.pop(context);
          ShowMessage.show(msg: AppLocalizations.of(context)!.restEmailMessage);
        }
      },
      child: Form(
        key: BlocProvider.of<RestPasswordCubit>(context).formKey,
        child: ListView(
          children: const [
            AppLogo(),
            EmailText(),
            SizedBox(height: ValuesManager.height8),
            RestPaswordEmailFeild(),
            SizedBox(height: ValuesManager.height24),
            RestPasswordButton(),
          ],
        ),
      ),
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
