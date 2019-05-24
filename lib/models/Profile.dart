class auth {

  final String uid;
  final String username;
  final String phone;
  final String email;
  final String role;

  auth._({this.uid,this.username, this.phone,this.email,this.role});

  factory auth.fromJson(Map<String, dynamic> json) {
    return new auth._(
      uid: json['uid'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      role: json['role'],
    );
  }

}