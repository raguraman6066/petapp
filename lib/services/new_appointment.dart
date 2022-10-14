import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petapp/widgets/custom_snackbar.dart';

class NewAppointments {
  static var auth = FirebaseFirestore.instance;
  static newAppoint(
      {required String petId,
      required bool isaddressBox,
      required String pickupAddress,
      required String service,
      required String startDate,
      required String endDate,
      required BuildContext context}) async {
    auth
        .collection('appointment')
        .doc(petId)
        .collection('appointments')
        .doc()
        .set({
          "service": service,
          "startDate": startDate,
          "endDate": endDate,
          "pickupAddress": pickupAddress,
          "isaddressBox": isaddressBox
        })
        .then((value) => CustomSnackbar.buildSnackbar(
            context: context, message: 'Appointment success'))
        .then((value) => Navigator.pop(context));
  }
}

class UpdateAppointments {
  static var auth = FirebaseFirestore.instance;
  static updateAppointment(
      {required String petId,
      required String id,
      required bool isaddressBox,
      required String pickupAddress,
      required String service,
      required String startDate,
      required String endDate,
      required BuildContext context}) async {
    auth
        .collection('appointment')
        .doc(petId)
        .collection('appointments')
        .doc(id)
        .update({
          "service": service,
          "startDate": startDate,
          "endDate": endDate,
          "pickupAddress": pickupAddress,
          "isaddressBox": isaddressBox
        })
        .then((value) => CustomSnackbar.buildSnackbar(
            context: context, message: 'Appointment success'))
        .then((value) => Navigator.pop(context));
  }
}
