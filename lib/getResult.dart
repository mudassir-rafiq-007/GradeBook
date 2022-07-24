import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class getResult extends StatelessWidget {
  final String documentID;
  getResult({required this.documentID});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    CollectionReference enroll = FirebaseFirestore.instance
        .collection('session18_22')
        .doc(firebaseUser.email)
        .collection('result');
    return FutureBuilder<DocumentSnapshot>(
        future: enroll.doc(documentID).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something Went Wrong'),
            );
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return Center(
              child: Text('Document Not Found'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map data = (snapshot.data!.data() ?? {}) as Map;
            return Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: double.maxFinite,
                  color: Color(0xFF27387e),
                  child: Text(
                    '${documentID} Semester',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                DataTable(
                    columnSpacing: MediaQuery.of(context).size.width * 0.05,
                    headingRowColor:
                        MaterialStateProperty.all(Color(0xFF27387e)),
                    headingTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    dataRowHeight: MediaQuery.of(context).size.height * 0.08,
                    dataTextStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: TableBorder.symmetric(
                      inside: BorderSide(
                        width: 1,
                        color: Color(0xFF27387e),
                      ),
                      outside: BorderSide(
                        width: 1,
                        color: Color(0xFF27387e),
                      ),
                    ),
                    columns: [
                      DataColumn(
                        label: Text('Code'),
                      ),
                      DataColumn(
                        label: Text('Subject'),
                      ),
                      DataColumn(
                        label: Text('Marks'),
                      ),
                      DataColumn(
                        label: Text('GPA'),
                      ),
                      DataColumn(
                        label: Text('Grade'),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('${data['code1']}')),
                        DataCell(Text('${data['subject1']}')),
                        DataCell(Text('${data['marks1']}')),
                        DataCell(Text('${data['gpa1']}')),
                        DataCell(Text('${data['grade1']}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('${data['code2']}')),
                        DataCell(Text('${data['subject2']}')),
                        DataCell(Text('${data['marks2']}')),
                        DataCell(Text('${data['gpa2']}')),
                        DataCell(Text('${data['grade2']}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('${data['code3']}')),
                        DataCell(Text('${data['subject3']}')),
                        DataCell(Text('${data['marks3']}')),
                        DataCell(Text('${data['gpa3']}')),
                        DataCell(Text('${data['grade3']}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('${data['code4']}')),
                        DataCell(Text('${data['subject4']}')),
                        DataCell(Text('${data['marks4']}')),
                        DataCell(Text('${data['gpa4']}')),
                        DataCell(Text('${data['grade4']}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('${data['code5']}')),
                        DataCell(Text('${data['subject5']}')),
                        DataCell(Text('${data['marks5']}')),
                        DataCell(Text('${data['gpa5']}')),
                        DataCell(Text('${data['grade5']}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(' ${data['code6']}')),
                        DataCell(Text(' ${data['subject6']}')),
                        DataCell(Text(' ${data['marks6']}')),
                        DataCell(Text(' ${data['gpa6']}')),
                        DataCell(Text(' ${data['grade6']}')),
                      ]),
                    ]),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Color(0xFF27387e),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'CGPA: ${data['cgpa']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      color: Color(0xFF27387e),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'SGPA: ${data['sgpa']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
