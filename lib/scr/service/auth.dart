import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  final FirebaseFirestore store = FirebaseFirestore.instance;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      store.collection("users").doc(userCredential.user?.uid).set({
        "uid": userCredential.user?.uid,
        "email": email,
      });
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code.toString());
    }
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      store.collection("users").doc(userCredential.user?.uid).set({
        "uid": userCredential.user?.uid,
        "email": email,
      });
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code.toString());
    }
  }

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}


