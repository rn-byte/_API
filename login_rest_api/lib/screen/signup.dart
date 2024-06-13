import 'package:flutter/material.dart';

import 'package:login_rest_api/screen/login.dart';
import 'package:login_rest_api/utils/text_filed_style.dart';
import 'package:provider/provider.dart';

import '../controller/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    //creating instance of controller class
    final signupProvider =
        Provider.of<SignupController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(20),
          height: 500,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          //creating consumer for extracting the value of controller class
          child: Consumer<SignupController>(
            builder: (context, signupValues, child) {
              return Form(
                key: signupValues.signupFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: signupValues.uemailController,
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        prefixIcon: const Icon(Icons.email),
                        label: const Text('Enter Email'),
                        enabledBorder: outlineInputBorder(color: Colors.black),
                        focusedBorder: outlineInputBorder(color: Colors.blue),
                        errorBorder: outlineInputBorder(color: Colors.red),
                        focusedErrorBorder:
                            outlineInputBorder(color: Colors.blue),
                      ),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Enter email';
                        } else if (!(value.toString().contains(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")))) {
                          return 'Invalid Email';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        signupValues.userEmail = value.toString().trim();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: signupValues.upassController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        label: const Text('Enter Password'),
                        enabledBorder: outlineInputBorder(color: Colors.black),
                        focusedBorder: outlineInputBorder(color: Colors.blue),
                        errorBorder: outlineInputBorder(color: Colors.red),
                        focusedErrorBorder:
                            outlineInputBorder(color: Colors.blue),
                      ),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Enter Password';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        signupValues.userPass = newValue.toString();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue[300])),
                        onPressed: () {
                          final isValid = signupProvider
                              .signupFormKey.currentState!
                              .validate();
                          if (isValid) {
                            signupProvider.signupFormKey.currentState!.save();
                            signupValues.userSignup(
                                signupValues.userEmail,
                                signupValues.userPass,
                                signupValues.uemailController,
                                signupValues.upassController);
                          }
                        },
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account ? ',
                          style: TextStyle(fontSize: 13),
                        ),
                        GestureDetector(
                          onTap: () {
                            signupValues.uemailController.clear();
                            signupValues.upassController.clear();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                          child: const Text(
                            ' Login',
                            style: TextStyle(
                              color: Colors.blue,
                              //decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
