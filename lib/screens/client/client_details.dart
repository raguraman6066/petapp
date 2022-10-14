import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/admin_login.dart';
import 'package:petapp/screens/client/add_clientdetails.dart';
import 'package:petapp/screens/client/edit_clientdetails.dart';
import 'package:petapp/screens/pet/pet_details.dart';

class ClientDetails extends StatelessWidget {
  var collection = FirebaseFirestore.instance.collection('client');
  showAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Are You Sure to Logout',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      return Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false);
                    });
                  },
                  child: Text('Yes'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Details'),
        actions: [
          IconButton(
              onPressed: () {
                showAlertDialog(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: collection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PetDetails(data.id),
                          ));
                      print('done');
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(data['name']),
                        subtitle: Text(data['mobile']),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditClientDetails(
                                          id: data.id,
                                        )));
                          },
                        ),
                      ),
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddClientDetails(),
            ),
          );
        },
      ),
    );
  }
}
