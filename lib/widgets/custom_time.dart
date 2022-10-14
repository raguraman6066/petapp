import 'package:flutter/material.dart';

class CustomTime extends StatefulWidget {
  final String hintText;
  final TextEditingController selectedTime;

  CustomTime({required this.hintText, required this.selectedTime});

  @override
  State<CustomTime> createState() => _CustomTimeState();
}

class _CustomTimeState extends State<CustomTime> {
  @override
  Widget build(BuildContext context) {
    Future<void> displayTimeDialog() async {
      final TimeOfDay? time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (time != null) {
        setState(() {
          widget.selectedTime.text = time.format(context);
        });
      }
    }

    return Column(
      children: [
        TextFormField(
          onTap: displayTimeDialog,
          controller: widget.selectedTime,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: widget.hintText,
            labelText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
