import 'package:shopping_app/feature/settings/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String name;
  final String email;
  final String phone;

  final String image;
  int? points;
  int? credit;
  String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    this.points,
    this.credit,
    this.token,
  }) : super(id: id, email: email, name: name, image: image, phone: phone);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        image: json['image'] as String,
        points: json['points'] as int?,
        credit: json['credit'] as int?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'points': points,
        'credit': credit,
        'token': token,
      };
}
