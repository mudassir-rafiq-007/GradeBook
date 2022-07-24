import 'package:flutter/material.dart';
import 'package:result/getStatusWithUserID.dart';

class statusScreen extends StatefulWidget {
  @override
  State<statusScreen> createState() => _statusScreenState();
}

class _statusScreenState extends State<statusScreen> {
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27387e),
        title: Text('Status'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: getStatusWithID(),
    );
  }
}
