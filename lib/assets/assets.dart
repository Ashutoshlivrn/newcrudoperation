
import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _firebaseAuth=  FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authstateChanges => _firebaseAuth.authStateChanges();

 
  Future<void> SignUpUser(String Username, String Password)async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: Username, password: Password);
  }

  Future<void> SignInUser(String UserEmail, String UserPassword) async{
    await _firebaseAuth.signInWithEmailAndPassword(email: UserEmail, password: UserPassword);
  }

  Future<void> SignOut() async {
    await _firebaseAuth.signOut();
  }
    Future<void> DeleteTheUser() async{
      await _firebaseAuth.currentUser?.delete();
    }
  }
