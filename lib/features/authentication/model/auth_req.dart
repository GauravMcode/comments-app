class AuthReq {
  String email;
  String password;
  String? name;

  AuthReq({
    required this.email,
    required this.password,
    this.name,
  });
}
