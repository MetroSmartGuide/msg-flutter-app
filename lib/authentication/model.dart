class User {
  String? uid;
  String? email;
  String? nickname;

  User({this.uid, this.email, this.nickname});

  Map<String, dynamic> toJson() => {'uid': uid, 'email': email, 'nickname': nickname};
}
