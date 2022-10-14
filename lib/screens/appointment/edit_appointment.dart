import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petapp/services/new_appointment.dart';
import 'package:petapp/widgets/custom_textfield.dart';
import '../../constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_date.dart';

class EditAppointment extends StatefulWidget {
  String petId, id;
  EditAppointment(this.petId, this.id);
  @override
  State<EditAppointment> createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> {
  var _formKey = GlobalKey<FormState>();

  var fromDate = TextEditingController();

  var toDate = TextEditingController();
  var pickupAddress = TextEditingController();

  String? service;
  bool isaddressBox = false;
  getAppointmentDetails() async {
    FirebaseFirestore.instance
        .collection('appointment')
        .doc(widget.petId)
        .collection('appointments')
        .doc(widget.id)
        .get()
        .then((value) {
      setState(() {
        service = value['service'];
        fromDate.text = value['startDate'];
        toDate.text = value['endDate'];
        isaddressBox = value['isaddressBox'];
        pickupAddress.text = value['pickupAddress'];
      });
    });
  }

  @override
  void initState() {
    getAppointmentDetails();
    super.initState();
  }

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
                      name: 'Update',
                      onSubmit: () async {
                        if (_formKey.currentState!.validate()) {
                          if (service == null) {
                            showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                      content: Text('Please select service'),
                                    ));
                          }
                          print('done');
                          print(service);
                          print(isaddressBox);

                          UpdateAppointments.updateAppointment(
                            petId: widget.petId,
                            id: widget.id,
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
