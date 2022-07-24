import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:result/authentication.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';



//Authentication Setup with UI
class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GradeBook',
        home: SignInWrapper(),
      ),
    );
  }
}

class SignInWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return MyExams();
    } else return LoginPage();

  }
}

// Login Page Content
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //Key for Form Validation
    final _formkey= GlobalKey<FormState>();

    //Controllers for saving email and password through text field
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital GradeBook',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF27387e),
          title: Text('GradeBook'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextField for Username
                TextFormField(
                  controller: emailController,
                  validator: (value){
                    if (value==null || value.isEmpty || !value.contains('@iub.edu.pk'))
                      return 'Enter Valid Username';
                    else return null;
                  },
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'rollnumber@iub.edu.pk',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF27387e,),),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF27387e,),),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red,),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // TextField for Password
                TextFormField(
                  controller: passwordController,
                  validator: (value){
                    if (value==null || value.isEmpty)
                      return 'Enter Password';
                    else return null;
                  },
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF27387e,),),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF27387e,),),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red,),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                // Button for Login
                Container(
                  height: 50,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: (){
                      if (_formkey.currentState!.validate()){
                        context.read<AuthenticationService>().signIn(
                            email: emailController.text, password: passwordController.text
                        );
                      }
                  },
                    child: Text('Login', style: TextStyle(
                      fontSize: 20,
                    ),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF27387e),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
