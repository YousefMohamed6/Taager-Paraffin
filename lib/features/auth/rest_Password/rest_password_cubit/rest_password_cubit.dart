import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';
import 'package:tager_paraffin/core/managers/keys_manager.dart';

part 'rest_password_state.dart';

class RestPasswordCubit extends Cubit<RestPasswordState> {
  RestPasswordCubit() : super(RestPasswordInitial());
  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> restPassword() async {
    emit(RestPasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      emit(RestPasswordSucess());
    } on FirebaseAuthException catch (e) {
      emit(RestPasswordFailure(exceptionMessage: e.code));
    }
  }

  String handleErrorMessage(
      {required String exceptionMessage, required BuildContext context}) {
    if (exceptionMessage == KeysManager.kInvalidEmail) {
      return AppLocalizations.of(context)!.wrongEmail;
    } else if (exceptionMessage == KeysManager.kNetworkConnection) {
      return AppLocalizations.of(context)!.networkConnection;
    } else {
      return exceptionMessage;
    }
  }
}
