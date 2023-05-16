import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food_app_design/resources/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fast_food_app_design/models/user.dart' as model;
import 'package:flutter/foundation.dart';

// authentication class created for authorization
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



// function to sign up the user
  // ignore: non_constant_identifier_names
  Future<String> SignUpUser(
      {required String email,
      required String password,
      required String username,
      required Uint8List file}) async {
    // initialises the error in to string variable res
    String res = 'error occured';
    // try and catch block very and authenticate the user

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          file != null) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // ignore: avoid_print
        print(credential.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageStorage("profilePics", file, false);

        //  add user to database
        model.User user = model.User(
            email: email,
            photoUrl: photoUrl,
            uid: credential.user!.uid,
            username: username);
        await _firestore
            .collection("users")
            .doc(credential.user!.uid)
            .set(user.toJson());
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
      // ignore: avoid_print
      print(res);
    }
    return res;
  }

  Future<String> SignInUser(
      {required String email, required String password}) async {
    String res = "an error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = "Please fill all fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> LogOutUser() async {
    await _auth.signOut();
  }
}
