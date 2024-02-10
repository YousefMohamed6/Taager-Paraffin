import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowMessage {
  static void show({required String msg}) {
    ShowMessage._toast(msg: msg);
    // : ShowMessage._snackBar(context, msg: msg);
  }

  static void _toast({required String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // static void _snackBar(BuildContext context, {required String msg}) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: CustomText(
  //         text: msg,
  //         fontSize: 16.0,
  //         color: Colors.white,
  //         textAlign: TextAlign.center,
  //       ),
  //       backgroundColor: Colors.grey,
  //       padding: const EdgeInsets.all(16),
  //       margin: const EdgeInsets.symmetric(horizontal: 125, vertical: 8),
  //       behavior: SnackBarBehavior.floating,
  //       duration: const Duration(seconds: 3),
  //       shape: const OutlineInputBorder(
  //         borderSide: BorderSide.none,
  //         borderRadius: BorderRadius.all(
  //           Radius.circular(16),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
