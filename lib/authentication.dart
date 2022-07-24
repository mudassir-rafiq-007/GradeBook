import 'package:firebase_auth/firebase_auth.dart';
import 'package:result/main.dart';
import 'main.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Firebase Authentication Setup for Login
class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  Future signIn({ email, password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return MyExams();
    }on FirebaseAuthException catch (e){
      Fluttertoast.showToast(msg: 'Invalid Username/Password' , gravity: ToastGravity.CENTER);
    }
  }
}