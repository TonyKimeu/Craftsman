import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userID;
  final String userName;
  final String email;
  final String phone;
  final String role;
  final String profilePictureURL;

  User({
    this.userID,
    this.userName,
    this.email,
    this.phone,
    this.role,
    this.profilePictureURL,
  });

  Map<String, Object> toJson() {
    return {
      'userID': userID,
      'userName': userName,
      'email': email == null ? '' : email,
      'phone': phone == null ? '' : phone,
      'role' : role,
      'profilePictureURL': profilePictureURL,
      'appIdentifier': 'flutter-onboarding'
    };
  }

  factory User.fromJson(Map<String, Object> doc) {
    User user = new User(
      userID: doc['userID'],
      userName: doc['userName'],
      email: doc['email'],
      phone: doc['phone'],
      role: doc['role'],
      profilePictureURL: doc['profilePictureURL'],
    );
    return user;
  }

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }
}
