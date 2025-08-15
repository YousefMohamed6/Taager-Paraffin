import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/managers/keys_manager.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final email = TextEditingController();
  final confirmEmail = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obSecureText = true;

  void visablePassword() {
    obSecureText = !obSecureText;
    emit(RegisterInitial());
  }

  Future<void> register() async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await FirebaseAuth.instance.currentUser?.updateDisplayName(name.text);
      await addUserDataToFirebase();
      emit(RegisterSucess());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(exceptionMessage: e.code));
    }
  }

  String handleErrorMessage(
      {required String exceptionMessage, required BuildContext context}) {
    if (exceptionMessage == KeysManager.kInvalidEmail) {
      return AppLocalizations.of(context)!.wrongEmail;
    } else if (exceptionMessage == KeysManager.kEmailAlreadyInUse) {
      return AppLocalizations.of(context)!.emailUsed;
    } else if (exceptionMessage == KeysManager.kWeakPassword) {
      return AppLocalizations.of(context)!.weakPassword;
    } else if (exceptionMessage == KeysManager.kNetworkConnection) {
      return AppLocalizations.of(context)!.networkConnection;
    } else {
      return exceptionMessage;
    }
  }

  Future<void> addUserDataToFirebase() async {
    CollectionReference userRefe =
        FirebaseFirestore.instance.collection(KeysManager.kUserRefr);
    emit(RegisterLoading());
    try {
      await userRefe
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({KeysManager.kphone: phone.text});
    } on Exception catch (e) {
      emit(RegisterFailure(exceptionMessage: e.toString()));
    }
  }
}
