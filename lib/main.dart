import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:result/enroll.dart';
import 'package:result/resultPage.dart';
import './status.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:result/login.dart';
import 'authentication.dart';
import 'package:provider/provider.dart';

// Main function to run App
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SignIn());
}

// Color shading
Map<int, Color> color = {
  50: Color.fromRGBO(39, 56, 126, .1),
  100: Color.fromRGBO(39, 56, 126, .2),
  200: Color.fromRGBO(39, 56, 126, .3),
  300: Color.fromRGBO(39, 56, 126, .4),
  400: Color.fromRGBO(39, 56, 126, .5),
  500: Color.fromRGBO(39, 56, 126, .6),
  600: Color.fromRGBO(39, 56, 126, .7),
  700: Color.fromRGBO(39, 56, 126, .8),
  800: Color.fromRGBO(39, 56, 126, .9),
  900: Color.fromRGBO(39, 56, 126, 1),
};

// Home Page
class MyExams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF27387e, color),
        primaryColor: Color(0xFF27387e),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF27387e),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

// For openning LMS from App
var url = 'https://lms.iub.edu.pk/my/';
void urlLaunch() async {
  launch(url);
}

//  Home Page Content
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        foregroundColor: Colors.white,
        title: Text('GradeBook'),
        leading: Icon(Icons.home),
        actions: [
          ElevatedButton.icon(onPressed: (){
            context.read<AuthenticationService>().signOut();
          }, icon: Icon(Icons.logout),label: Text(''),)
        ],
      ),
      backgroundColor: Colors.white,
      

// Buttons on Home Page
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Status Button
              Container(
                height: size.height * 0.20,
                width: size.height * 0.20,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => statusScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Status',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Color(0xFF27387e),
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              // Results Button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0xFF27387e),
                ),
                height: size.height * 0.20,
                width: size.height * 0.20,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => resultPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Results',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Enrolled Button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0xFF27387e),
                ),
                height: size.height * 0.20,
                width: size.height * 0.20,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyEnroll(),
                      ),
                    );
                  },
                  child: Text(
                    'Enrolled',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              //LMS Button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Color(0xFF27387e),
                ),
                height: size.height * 0.20,
                width: size.height * 0.20,
                child: OutlinedButton(
                  onPressed: urlLaunch,
                  child: Text(
                    'LMS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
