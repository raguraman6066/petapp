import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petapp/widgets/custom_textfield.dart';

import '../../constants.dart';
import '../../services/update_clientdetails.dart';
import '../../widgets/custom_button.dart';

class EditClientDetails extends StatefulWidget {
  String id;

  EditClientDetails({required this.id});

  @override
  State<EditClientDetails> createState() => _EditClientDetailsState();
}

class _EditClientDetailsState extends State<EditClientDetails> {
  var formKey = GlobalKey<FormState>();

  var name = TextEditingController();

  var address = TextEditingController();

  var mobile = TextEditingController();

  var email = TextEditingController();
  @override
  void initState() {
    getUserDetails(
      id: widget.id,
    );
    super.initState();
  }

  getUserDetails({required String id}) async {
    FirebaseFirestore.instance.collection('client').doc(id).get().then((value) {
      setState(() {
        name.text = value['name'];
        address.text = value['address'];
        mobile.text = value['mobile'];
        email.text = value['email'];
      });
    });
  }

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
                  Text(
                    'Client Details',
                    style: headingTextStyle,
                  ),
                  heightSpace,
                  CustomTextField(
                    value: name,
                    text: 'Name',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                    },
                  ),
                  heightSpace,
                  CustomTextField(
                    textInputType: TextInputType.multiline,
                    maxLine: 5,
                    minLine: 3,
                    value: address,
                    text: 'Address',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                    },
                  ),
                  heightSpace,
                  CustomTextField(
                    textInputType: TextInputType.number,
                    value: mobile,
                    text: 'Mobile ',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                    },
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
                  CustomButton(
                      name: 'Update',
                      onSubmit: () async {
                        if (formKey.currentState!.validate()) {
                          await UpdateClinet.updateClientDetails(
                            id: widget.id,
                            name: name.text,
                            address: address.text,
                            mobile: mobile.text,
                            email: email.text,
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
