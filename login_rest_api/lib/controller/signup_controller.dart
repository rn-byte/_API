import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/signup_services.dart';

class SignupController with ChangeNotifier {
  TextEditingController uemailController = TextEditingController();
  TextEditingController upassController = TextEditingController();
  String userEmail = '';
  String userPass = '';
  GlobalKey<FormState> signupFormKey = GlobalKey();

  userSignup(
      String userEmail,
      String userPass,
      TextEditingController uemailController,
      TextEditingController upassController) async {
    if (uemailController.text.toString() == '' &&
        upassController.text.toString() == '') {
      Fluttertoast.showToast(
          msg: 'Please Enter Details',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
      notifyListeners();
    } else {
      UserSignupService.signupFun(userEmail, userPass);
      notifyListeners();
    }
  }
}
