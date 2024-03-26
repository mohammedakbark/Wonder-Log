import 'package:flutter/material.dart';

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
    notifyListeners();
  }

  isTextVisible() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
