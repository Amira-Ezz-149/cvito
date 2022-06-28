import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvito/layout/sign_in_up_screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationEmail {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? authResult;
  Future<String?> signUp({required String email, required String password,required String name}) async {
    try {
      authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance.collection("users").doc(authResult!.user!.uid).set({'name':name,'password':password});
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future<String?> signIn({required String email, required String password}) async {
    try {
      authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut(BuildContext context) async {
    try {
      await _auth.signOut().then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (_)=> SignInScreen()));
      });
    }on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  //Reset password
  Future<String?> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}