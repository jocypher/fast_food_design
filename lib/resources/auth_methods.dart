import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fast_food_app_design/models/user.dart' as model;
import 'package:flutter/foundation.dart';

// authentication class created for authorization
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<model.User> getUserDetails() async {
    User currentuser = _auth.currentUser!;
    DocumentSnapshot snapshot =
        await _firestore.collection("users").doc(currentuser.uid).get();

    return model.User.fromSnap(snapshot);
  }

// function to sign up the user
  // ignore: non_constant_identifier_names
  Future<String> SignUpUser(
      {required String email,
      required String password,
      required String username,
      // required Uint8List file
      }) async {
    // initialises the error in to string variable res
    String res = 'error occured';
    // try and catch block very and authenticate the user
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // ignore: avoid_print
        print(credential.user!.uid);

        //  add user to database
        await _firestore.collection("users").doc(credential.user!.uid).set({
          "username": username,
          "uid": credential.user!.uid,
          "email": email
        });
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
      // ignore: avoid_print
      print(res);
    }
    return res;
  }
}
