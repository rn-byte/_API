import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

import '../screen/home.dart';

class UserLoginService {
  static loginFun(String userEmail, String userPass) async {
    try {
      var header = {
        'content-type': 'application/json',
      };
      var body = {
        'email': userEmail.toString().trim(),
        'password': userPass.toString().trim(),
      };

      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: header,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body.toString());
        debugPrint(json['token']);
        if (json['token'] != '') {
          Fluttertoast.showToast(
              msg: 'Login Successful !',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER);
          Get.offAll(() => const MyHomePage());
        } else {
          Fluttertoast.showToast(
              msg: 'Invalid Credentials',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER);
        }
      } else {
        debugPrint('unsuccessful');
        Fluttertoast.showToast(
            msg: 'Invalid Credentials',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      debugPrint('Error : $e');
    }
  }
}
