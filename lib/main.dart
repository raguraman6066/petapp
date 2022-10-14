import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petapp/screens/admin_login.dart';
import 'package:petapp/screens/client/client_details.dart';
import 'package:petapp/screens/pet/pet_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //flutter framework
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.teal,
          appBarTheme: const AppBarTheme(
            color: Colors.orange,
          ),
          fontFamily: 'SourceSansPro',
          textTheme: const TextTheme(
            //app bar
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          )),
      home: FirebaseAuth.instance.currentUser == null
          ? LoginScreen()
          : ClientDetails(),
    );
  }
}
