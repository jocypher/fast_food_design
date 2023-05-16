// created a class user for every user that registers with the account
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String photoUrl;
  final String uid;
  final String username;
  const User(
      {required this.email,
      required this.photoUrl,
      required this.uid,
      required this.username});

  Map<String, dynamic> toJson() =>
      {'email': email, 'photoUrl': photoUrl, 'uid': uid, 'username': username};

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        email: snapshot['email'],
        photoUrl: snapshot['photoUrl'],
        uid: snapshot['uid'],
        username: snapshot['username']);
  }
}
