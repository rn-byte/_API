import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginController with ChangeNotifier {
  String userEmail = '';
  String userPass = '';
  GlobalKey<FormState> loginFormKey = GlobalKey();

  userLogin(String userEmail, String userPass) {
    debugPrint(userEmail + userPass);
  }
}
