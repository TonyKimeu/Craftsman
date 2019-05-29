import 'dart:async';
import 'package:craftsman/models/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsman/models/user.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError, UnknownError }


class Auth {
  static Future<String> signIn(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    /*if(email === 'a@a.local' && password === '1234'){
      // Return user details as validated.
      data[];
      data = {

        result{
          name: "me",
          email: "a@a.local",
          role: "client",
          uhash: "fsty536373hvfhht357383dgdhdddfe46"
        },

      };
      return data;
    }else{

      // Return failed data array.

    }
*/
    return user.uid;
  }

 /* static Future<String> signInWithFacebok(String accessToken) async {
    FirebaseUser user = await FirebaseAuth.instance
        .signInWithFacebook(accessToken: accessToken);
    return user.uid;
  }*/

  static Future<String> signUp(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  static Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  static Future<FirebaseUser> getCurrentFirebaseUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  static void addUser(User user) async {
    checkUserExist(user.userID).then((value) {
      if (!value) {
        print("user ${user.userName} ${user.email} added");
        Firestore.instance
            .document("users/${user.userID}")
            .setData(user.toJson());
      } else {
        print("user ${user.userName} ${user.email} exists");
      }
    });
  }

  static Future<bool> checkUserExist(String userID) async {
    bool exists = false;
    try {
      await Firestore.instance.document("users/$userID").get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

  static Stream<User> getUser(String userID) {
    return Firestore.instance
        .collection("users")
        .where("userID", isEqualTo: userID)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.documents.map((doc) {
        return User.fromDocument(doc);
      }).first;
    });
  }

  static String getExceptionText(Exception e) {
    if (e is PlatformException) {
      switch (e.message) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          return 'Incorrect Email or password.';
          break;
        case 'The password is invalid or the user does not have a password.':
          return 'Incorrect Email or password.';
          break;
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          return 'No internet connection.';
          break;
        case 'The email address is already in use by another account.':
          return 'Email address is already taken.';
          break;
        default:
          return 'Unknown error occured.0';
      }
    } else {
      return 'Unknown error occured.1';
    }
  }
}
