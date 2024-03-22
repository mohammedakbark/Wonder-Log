import 'package:flutter/widgets.dart';

class AuthController with ChangeNotifier {
  bool obscureText = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  isTextVisible() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
