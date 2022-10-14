import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/appointment/new_appointment.dart';
import 'package:petapp/screens/pet/pet_formedit.dart';
import 'package:petapp/screens/appointment/pet_service_history.dart';
import 'package:petapp/screens/pet/petform.dart';

class PetDetails extends StatefulWidget {
  String id;
  PetDetails(this.id);

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  @override
  Widget build(BuildContext context) {
    var collection = FirebaseFirestore.instance
        .collection('pet details')
        .doc(widget.id)
        .collection('pet');

    return Scaffold(
        appBar: AppBar(
          title: Text('Pet Details'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: collection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index];
                    return Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.orange,
                      child: Column(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text(data['petname']),
                              subtitle: Text(data['breed']),
                              trailing: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  print(data.id);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PetEditForm(
                                                userid: widget.id,
                                                petid: data.id,
                                              )));
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewAppointment(data.id)));
                                },
                                child: Text('New Appointment'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PetServiceHistory(data.id)));
                                },
                                child: Text('History'),
                              ),
                            ],
                          ),
                        ],
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
                builder: (context) => PetForm(widget.id),
              ),
            );
          },
        ));
  }
}
