//Custom class in project directory
import 'package:flutter/material.dart';

class CustomSnackbar {
  static buildSnackbar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$message"),
      ),
    );
  }
}
