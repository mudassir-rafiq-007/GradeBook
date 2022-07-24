import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class getStatusWithID extends StatefulWidget {
  @override
  State<getStatusWithID> createState() => _getStatusWithIDState();
}

class _getStatusWithIDState extends State<getStatusWithID> {

  final firebaseUser = FirebaseAuth.instance.currentUser!;
  CollectionReference users =
      FirebaseFirestore.instance.collection('session18_22');


  @override
  Widget build(BuildContext context) {
    // // TODO: implement build
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(firebaseUser.email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Center(child: Text("Document does not exist"));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              ListTile(
                title: Text(
                  'Name: ${data['name']}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                tileColor: Colors.grey[200],
                textColor: Color(0xFF27387e),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Father Name: ${data['father name']}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                tileColor: Colors.grey[200],
                textColor: Color(0xFF27387e),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Semester: ${data['semester']}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                tileColor: Colors.grey[200],
                textColor: Color(0xFF27387e),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Section: ${data['section']}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                tileColor: Colors.grey[200],
                textColor: Color(0xFF27387e),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'CGPA: ${data['cgpa']}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                tileColor: Colors.grey[200],
                textColor: Color(0xFF27387e),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Session: ${data['session']}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                tileColor: Colors.grey[200],
                textColor: Color(0xFF27387e),
              ),
            ],
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
