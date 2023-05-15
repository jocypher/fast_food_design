import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  Future<String> SignUpUser(
      {required String email,
      required String Password,
      required String username,
      required Uint8List file}) async {
        // initialises the error in to string variable res
    String res = 'error occured';
    // try and catch block very and authenticate the user
    try {
      if (email.isNotEmpty || Password.isNotEmpty || username.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: Password);
        print(credential.user!.uid);

        //storage date to keep the photos
        // String photoUrl = await StorageMethods().

        // model.User user = model.User(
        //   email: email, photoUrl: photoUrl, uid: credential.user!.uid, username: username);
      }
    } catch (err) {
      res = err.toString();
      print(res);
    }
    return res;
  }
}
