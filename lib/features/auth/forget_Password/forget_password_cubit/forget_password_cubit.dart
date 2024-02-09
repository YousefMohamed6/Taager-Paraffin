import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> restPassword() async {
    emit(ForgetPasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      emit(ForgetPasswordSucess());
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordFailure(errorMessage: e.code));
    }
  }
}
