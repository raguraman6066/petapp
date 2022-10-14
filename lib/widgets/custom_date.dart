import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CustomDate extends StatelessWidget {
  CustomDate(
      {required this.controller, required this.hint, required this.validate});
  String? Function(String?) validate;
  final TextEditingController controller;
  String? hint;
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      type: DateTimePickerType.date,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        labelText: hint,
      ),
      firstDate: DateTime(2000),
      lastDate: DateTime(2200),
      validator: validate,
      controller: controller,
    );
  }
}
