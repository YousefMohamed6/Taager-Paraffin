import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name.text);
      emit(RegisterSucess());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(errorMessage: e.code));
    }
  }
}
