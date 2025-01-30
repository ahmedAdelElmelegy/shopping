class UserData {
  final int id;
  final String email;
  final String username;

  final String token;

  UserData({
    required this.id,
    required this.email,
    required this.username,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      username: json['name'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
