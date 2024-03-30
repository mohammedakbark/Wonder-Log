import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/snack_bar.dart';
import 'package:wanderlog/util/style.dart';
import 'package:wanderlog/view/navigation_bar.dart';

class AuthController with ChangeNotifier {
  bool obscureText = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController confirmPasswordcontroller = TextEditingController();
  TextEditingController nameController = TextEditingController();

  clearController() {
    emailcontroller.clear();
    passwordcontroller.clear();
    confirmPasswordcontroller.clear();
    nameController.clear();
    print("--------Clear controller");
    // notifyListeners();
  }

  isTextVisible() {
    obscureText = !obscureText;
    notifyListeners();
  }

  final auth = FirebaseAuth.instance;

  Future signUp(String email, String password, context) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorSnackBar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        errorSnackBar(context, "The account already exists for that email.");
      } else {
        errorSnackBar(context, e.code);
      }
    }
  }

  Future signIn(String email, String password, context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => Navigation(),
            ),
            (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        errorSnackBar(context, 'Wrong password provided for that user.');
      } else {
        errorSnackBar(context, e.code);
      }
    }
  }

  // showCustomeDiologeu(context, error) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       backgroundColor: WHITE,
  //       shape: const ContinuousRectangleBorder(),
  //       content: Text(
  //         error,
  //         style: nunitoStyle(
  //             letterSpacing: 1, fontsize: 17, fontWeight: FontWeight.w300),
  //       ),
  //     ),
  //   );
  // }
}
