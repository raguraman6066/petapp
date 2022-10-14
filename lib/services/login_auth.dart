import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/client/client_details.dart';
import '../widgets/custom_snackbar.dart';

class LoginService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static loginAuth({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((error) => CustomSnackbar.buildSnackbar(
            context: context, message: error.message))
        .then((value) => CustomSnackbar.buildSnackbar(
              context: context,
              message: 'Login Successful',
            ))
        .then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ClientDetails(),
              ),
            ));
  }
}
