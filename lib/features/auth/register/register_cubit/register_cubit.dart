import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/uitls/key_manager.dart';
import 'package:tager_paraffin/generated/l10n.dart';

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
    if (exceptionMessage == KeyManager.kInvalidEmail) {
      return S.of(context).wrongEmail;
    } else if (exceptionMessage == KeyManager.kEmailAlreadyInUse) {
      return S.of(context).emailUsed;
    } else if (exceptionMessage == KeyManager.kWeakPassword) {
      return S.of(context).weakPassword;
    } else if (exceptionMessage == KeyManager.kNetworkConnection) {
      return S.of(context).networkConnection;
    } else {
      return exceptionMessage;
    }
  }

  Future<void> addUserDataToFirebase() async {
    CollectionReference userRefe =
        FirebaseFirestore.instance.collection(KeyManager.kUserRefr);
    emit(RegisterLoading());
    try {
      await userRefe
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({KeyManager.kphone: phone.text});
    } on Exception catch (e) {
      emit(RegisterFailure(exceptionMessage: e.toString()));
    }
  }
}
