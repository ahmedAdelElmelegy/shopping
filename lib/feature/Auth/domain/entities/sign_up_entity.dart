class SignUpEntity {
  final String email;
  final String password;
  final String phone;
  final String username;

  SignUpEntity({
    required this.email,
    required this.password,
    required this.phone,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phone': phone,
      'name': username,
    };
  }
}
