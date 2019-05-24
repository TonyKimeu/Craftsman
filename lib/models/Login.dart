class Login {
  final String id;
  final String uid;
  final String email;
  final String password;

  Login._({this.id, this.uid,this.email, this.password});

  factory Login.fromJson(Map<String, dynamic> json) {
    return new Login._(
      id: json['id'],
      uid: json['uid'],
      email: json['email'],
      password: json['password'],
    );
  }

}