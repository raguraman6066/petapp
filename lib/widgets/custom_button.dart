import 'package:flutter/material.dart';

//button
class CustomButton extends StatelessWidget {
  String name;
  VoidCallback onSubmit;
  CustomButton({required this.name, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSubmit,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 35),
        padding: EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.orangeAccent,
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
