import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/key_manager.dart';
import 'package:tager_paraffin/generated/l10n.dart';

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
    if (exceptionMessage == KeyManager.kInvalidEmail) {
      return S.of(context).wrongEmail;
    } else if (exceptionMessage == KeyManager.kNetworkConnection) {
      return S.of(context).networkConnection;
    } else {
      return exceptionMessage;
    }
  }
}
