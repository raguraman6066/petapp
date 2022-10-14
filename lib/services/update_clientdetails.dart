import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petapp/widgets/custom_snackbar.dart';

class UpdateClinet {
  static var auth = FirebaseFirestore.instance;
  static updateClientDetails(
      {required String id,
      required String name,
      required String address,
      required String mobile,
      required String email,
      required BuildContext context}) async {
    auth
        .collection('client')
        .doc(id)
        .update({
          "name": name,
          "address": address,
          "mobile": mobile,
          "email": email,
          "id": id,
        })
        .then((value) => CustomSnackbar.buildSnackbar(
            context: context, message: 'Update success'))
        .then((value) => Navigator.pop(context));
  }
}
