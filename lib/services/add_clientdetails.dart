import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petapp/widgets/custom_snackbar.dart';

class AddClient {
  static var auth = FirebaseFirestore.instance;
  static addClientDetails(
      {required String name,
      required String address,
      required String mobile,
      required String email,
      required BuildContext context}) async {
    var id = await auth.collection('client').doc().id;
    auth
        .collection('client')
        .doc(id)
        .set({
          "name": name,
          "address": address,
          "mobile": mobile,
          "email": email,
          "id": id,
        })
        .then((value) => CustomSnackbar.buildSnackbar(
            context: context, message: 'Registration success'))
        .then((value) => Navigator.pop(context));
  }
}
