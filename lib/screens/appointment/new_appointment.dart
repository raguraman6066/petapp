import 'package:flutter/material.dart';
import 'package:petapp/services/new_appointment.dart';
import 'package:petapp/widgets/custom_textfield.dart';

import '../../constants.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_date.dart';

class NewAppointment extends StatefulWidget {
  String petId;
  NewAppointment(this.petId);
  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  var _formKey = GlobalKey<FormState>();

  var fromDate = TextEditingController();

  var toDate = TextEditingController();
  var pickupAddress = TextEditingController();

  String? service;
  bool isaddressBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Appointment Details',
                    style: headingTextStyle,
                  ),
                  heightSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                          value: 'Boarding',
                          groupValue: service,
                          onChanged: (String? value) {
                            setState(() {
                              service = value;
                              isaddressBox = false;
                              pickupAddress.text = '';
                            });
                          }),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Boarding',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Radio(
                        value: 'Training',
                        groupValue: service,
                        onChanged: (String? value) {
                          setState(() {
                            service = value;
                            isaddressBox = false;
                            pickupAddress.text = '';
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Training',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                          value: 'Grooming',
                          groupValue: service,
                          onChanged: (String? value) {
                            setState(() {
                              service = value;
                              isaddressBox = false;
                              pickupAddress.text = '';
                            });
                          }),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Grooming',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Radio(
                        value: 'Pick Drop',
                        groupValue: service,
                        onChanged: (String? value) {
                          setState(() {
                            service = value;
                            isaddressBox = true;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Pick Drop',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  heightSpace,
                  Row(
                    children: [
                      Expanded(
                        child: CustomDate(
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                          controller: fromDate,
                          hint: 'Start Date',
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: CustomDate(
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                          controller: toDate,
                          hint: 'End Date',
                        ),
                      ),
                    ],
                  ),
                  heightSpace,
                  Visibility(
                    visible: isaddressBox,
                    child: CustomTextField(
                        minLine: 3,
                        maxLine: 4,
                        textInputType: TextInputType.multiline,
                        value: pickupAddress,
                        text: 'Pickup Address',
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          }
                        }),
                  ),
                  heightSpace,
                  CustomButton(
                      name: 'Submit',
                      onSubmit: () async {
                        if (_formKey.currentState!.validate()) {
                          if (service == null) {
                            showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                      content: Text('Please select service'),
                                    ));
                            return;
                          }
                          print('done');
                          print(service);
                          print(isaddressBox);

                          NewAppointments.newAppoint(
                            petId: widget.petId,
                            isaddressBox: isaddressBox,
                            service: service.toString(),
                            startDate: fromDate.text,
                            endDate: toDate.text,
                            pickupAddress: pickupAddress.text,
                            context: context,
                          );
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
