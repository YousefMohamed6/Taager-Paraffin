import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tager_paraffin/core/uitls/key_manager.dart';
import 'package:tager_paraffin/generated/l10n.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obSecureText = true;
  void visablePassword() {
    obSecureText = !obSecureText;
    emit(LoginInitial());
  }

  Future<void> signInWithEmailAndPassword() async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      emit(LoginSucess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(exceptionMessage: e.code));
    }
  }

  String handelErrorMessage(
      {required String exceptionMessage, required BuildContext context}) {
    if (exceptionMessage == KeyManager.kInvalidCredential) {
      return S.of(context).wrongPassword;
    } else if (exceptionMessage == KeyManager.kInvalidEmail) {
      return S.of(context).wrongEmail;
    } else if (exceptionMessage == KeyManager.kDifferentCredential) {
      return S.of(context).emailUsed;
    } else if (exceptionMessage == KeyManager.kNetworkConnection) {
      return S.of(context).networkConnection;
    } else {
      return exceptionMessage;
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(LoginSucess());
    } on Exception catch (e) {
      emit(LoginFailure(exceptionMessage: e.toString()));
    }
  }

  Future<void> signInWithGoogleWeb() async {
    emit(LoginLoading());
    try {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithPopup(googleProvider);
      emit(LoginSucess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(exceptionMessage: e.code));
    }
  }

  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      emit(LoginSucess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(exceptionMessage: e.code));
    }
  }
}
