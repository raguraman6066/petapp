import 'package:flutter/material.dart';

//textfield
class CustomTextField extends StatelessWidget {
  var value = TextEditingController();
  String text = '';
  int maxLine;
  int minLine;
  TextInputType textInputType;
  String? Function(String?) validate;
  bool obscure;
  Widget? suffixIcon;
  CustomTextField(
      {required this.value,
      required this.text,
      required this.validate,
      this.maxLine = 1,
      this.minLine = 1,
      this.textInputType = TextInputType.emailAddress,
      this.obscure = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscure,
        keyboardType: textInputType,
        maxLines: maxLine,
        minLines: minLine,
        controller: value,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(),
          hintText: text,
          labelText: text,
        ),
        validator: validate);
  }
}
