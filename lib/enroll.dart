import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:result/getEnrollData.dart';

// Enrollment Page
class MyEnroll extends StatefulWidget {
  @override
  State<MyEnroll> createState() => _MyEnrollState();
}

class _MyEnrollState extends State<MyEnroll> {
  final List<String> docIDs = [];
  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('session18_22')
        .doc('fa18m2bb013@iub.edu.pk')
        .collection('enrollments')
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF27387e),
          title: const Text('Current Enrollments'),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: FutureBuilder(
            future: getDocID(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return getEnrollData(documentID: docIDs[index],);
                  });
            }),
      ),
    );
  }
}
