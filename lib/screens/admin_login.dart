import 'package:flutter/material.dart';
import 'package:petapp/widgets/custom_button.dart';

import '../constants.dart';
import '../services/login_auth.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var email = TextEditingController();

  var password = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/logo.png'),
                  ),
                  heightSpace,
                  CustomTextField(
                    value: email,
                    text: 'Email',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                    },
                  ),
                  heightSpace,
                  CustomTextField(
                    obscure: obscure,
                    value: password,
                    text: 'Pasword',
                    suffixIcon: IconButton(
                      icon: obscure == false
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        this.setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                    },
                  ),
                  heightSpace,
                  CustomButton(
                      name: 'Login',
                      onSubmit: () {
                        if (formKey.currentState!.validate()) {
                          LoginService.loginAuth(
                              email: email.text,
                              password: password.text,
                              context: context);
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
