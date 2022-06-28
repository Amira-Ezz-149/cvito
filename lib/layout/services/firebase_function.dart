import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../set_info_screen/set_info1_screen.dart';
import 'indecator.dart';

class FirebaseFunctions{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String?> creatUserCredential(String name , String email) async{
    try{
      await _firebaseFirestore.collection('users').doc(_auth.currentUser!.uid).set(
        {
          "uid" : _auth.currentUser!.uid,
          'name': name,
          'email': email,
        }
      ).then((value){
        Indicator.closeLoading();
        Get.to(()=> SetInfo1());
      });
    }on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}