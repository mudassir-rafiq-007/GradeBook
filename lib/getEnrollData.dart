import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class getEnrollData extends StatelessWidget {
  final String documentID;
  getEnrollData({required this.documentID});

  @override
  Widget build(BuildContext context) {
    CollectionReference enroll = FirebaseFirestore.instance
        .collection('session18_22')
        .doc('fa18m2bb013@iub.edu.pk')
        .collection('enrollments');
    return FutureBuilder<DocumentSnapshot>(
        future: enroll.doc(documentID).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(
                  'Subject: ${data['subject']}',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                textColor: Color(0xFF27387e),
                tileColor: Colors.grey[200],
                subtitle: Text(
                  'Instructor: ${data['instructor']}',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),

              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    // TODO: implement build
    throw UnimplementedError();
  }
}
