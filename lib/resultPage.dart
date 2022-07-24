import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:result/getResult.dart';
import 'package:firebase_auth/firebase_auth.dart';

class resultPage extends StatefulWidget {
  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  final List<String> docIDs = [];
  final firebaseUser = FirebaseAuth.instance.currentUser;
  Future getDocID() async {

    await FirebaseFirestore.instance
        .collection('session18_22')
        .doc(firebaseUser?.email)
        .collection('result')
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27387e),
        title: Text('Result'),
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
                  return getResult(
                    documentID: docIDs[index],
                  );
                }
                );
           }
           ),
    );
  }
}
