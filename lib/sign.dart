import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class DigitalSign extends StatefulWidget {
  const DigitalSign({Key? key}) : super(key: key);

  @override
  State<DigitalSign> createState() => _DigitalSignState();
}

class _DigitalSignState extends State<DigitalSign> {
  Uint8List? exportedImage;

  GlobalKey<SignatureState> _signaturePadKey = GlobalKey();
  SignatureController controller = SignatureController();

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('sign')
        .doc('qG61ejFyYSDJvqVZwEHa')
        .get()
        .then((value) => setState(() {
              var imageSav = value['image'];
              List<int> intList =
                  imageSav!.cast<int>().toList(); //This is the magical line.
              exportedImage = Uint8List.fromList(intList);
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Center(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Signature(
                  key: _signaturePadKey,
                  controller: controller,
                  height: 150,
                  width: double.infinity,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        exportedImage = await controller.toPngBytes();
                        this.setState(() {});
                        FirebaseFirestore.instance
                            .collection('sign')
                            .add({"image": exportedImage});
                        print('done');
                      },
                      child: Text('save')),
                  ElevatedButton(
                      onPressed: () {
                        // controller.clear();
                        /*           if (controller.isEmpty) {
                          print('error');
                        } else {
                          print('done');
                        }*/
                      },
                      child: Text('clear')),
                  ElevatedButton(onPressed: () {}, child: Text('get')),
                ],
              ),
              if (exportedImage != null)
                Container(
                  child: Image.memory(exportedImage!),
                ),
            ],
          )),
        ),
      ),
    );
  }
}
