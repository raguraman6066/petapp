import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'edit_appointment.dart';

class PetServiceHistory extends StatelessWidget {
  String petId;
  PetServiceHistory(this.petId);

  @override
  Widget build(BuildContext context) {
    var collection = FirebaseFirestore.instance
        .collection('appointment')
        .doc(petId)
        .collection('appointments');
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Service History'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: collection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditAppointment(petId, data.id)));
                        },
                      ),
                      title: Text(data['service']),
                      subtitle: Text(
                          'From:  ${data['startDate']}    To:  ${data['endDate']}'),
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
