import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract class IAuthService {
  Future<void> loginWithEmail(
      {required String email, required String password});
  Future<void> loginWithPhone({required String phone});
  Future<void> loginWithFacebook();
  Future<void> loginWithApple();
  Future<void> loginWithGoogle();
  Future<void> signOut();
  Future<UserCredential> signUp(
      {required String email, required String password});
  Future<void> verifyOtp(
      {required Future<void> Function(AuthCredential credential) onSuccess,
      required String smsCode});
  Future<void> sendOtp({required OTPData otp});
  Future<void> updatePassword(String password);
  Future<void> forgetEmailPassword({required String email});
}

class FirebaseAuthService implements IAuthService {
  @override
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> loginWithPhone({required String phone}) async {
    _sendOtpToPhoneNumber(phone);
  }

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<void> loginWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(
      loginResult.accessToken?.tokenString ?? '',
    );
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Future<void> loginWithApple() async {
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      nonce: nonce,
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
      rawNonce: rawNonce,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    final fullName = appleCredential.givenName;
    if (fullName == null || fullName.isEmpty) return;
    await FirebaseAuth.instance.currentUser?.updateDisplayName(fullName);
  }

  @override
  Future<void> loginWithGoogle() async {
    final GoogleSignInAccount googleUser =
        await GoogleSignIn.instance.authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn.instance.signOut();
  }

  @override
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  @override
  Future<void> verifyOtp({
    required Future<void> Function(AuthCredential credential) onSuccess,
    required String smsCode,
  }) async {
    if (verificationId == null) {
      return;
    }
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: smsCode,
    );
    await onSuccess(credential);
  }

  String? verificationId;
  @override
  Future<void> sendOtp({required OTPData otp}) async {
    await _sendOtpToPhoneNumber(otp.phoneCode + otp.phoneNumber);
  }

  Future<void> _sendOtpToPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verifyId, int? resendToken) {
        verificationId = verifyId;
      },
      codeAutoRetrievalTimeout: (String verifyId) {
        verificationId = verifyId;
      },
      timeout: const Duration(seconds: 120),
    );
  }

  @override
  Future<void> updatePassword(String password) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(password);
  }

  @override
  Future<void> forgetEmailPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}

class OTPData {
  final String phoneCode;
  final String phoneNumber;

  OTPData({required this.phoneCode, required this.phoneNumber});
}
