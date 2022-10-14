import 'package:flutter/material.dart';
import 'package:petapp/widgets/custom_textfield.dart';
import '../../constants.dart';
import '../../services/add_clientdetails.dart';
import '../../widgets/custom_button.dart';

class AddClientDetails extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var address = TextEditingController();
  var mobile = TextEditingController();
  var email = TextEditingController();

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
                  const Text(
                    'Client Details',
                    style: headingTextStyle,
                  ),
                  heightSpace,
                  CustomTextField(
                    value: name,
                    text: 'Client Name',
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
                      name: 'Submit',
                      onSubmit: () async {
                        if (formKey.currentState!.validate()) {
                          await AddClient.addClientDetails(
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
