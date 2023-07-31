import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication/utils/custom_snackbar.dart';

class CommonUtils {
  static String verify = "";
  static int resendToken = -1;

  static Future<String> firebasePhoneAuth(
      {required String phone, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
            print('Phone Credentials $phoneAuthCredential');
          },
          verificationFailed: (FirebaseAuthException exception) {
            print('Verification Failed $exception');
            showSnackBar(context, 'Verification Failed! Try after some time.');
          },
          codeSent: (String verificationId, int? resendToken) async {
            CommonUtils.verify = verificationId;
            CommonUtils.resendToken = resendToken!;
            print('Verify: $verificationId');
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
      return CommonUtils.verify;
    } catch (e) {
      print('Exception $e');
      return "";
    }
  }

  static Future<String> firebaseResendToken(
      {required String phone, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
            print('Phone Credentials $phoneAuthCredential');
          },
          verificationFailed: (FirebaseAuthException exception) {
            print('Verification Failed $exception');
            showSnackBar(context, 'Verification Failed! Try after some time.');
          },
          codeSent: (String verificationId, int? resendToken) async {
            CommonUtils.verify = verificationId;
            print('Verify: $verificationId');
          },
          forceResendingToken: CommonUtils.resendToken,
          codeAutoRetrievalTimeout: (String verificationId) {});
      return CommonUtils.verify;
    } catch (e) {
      print('Exception $e');
      return "";
    }
  }
}
