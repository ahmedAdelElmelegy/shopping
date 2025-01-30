import 'package:shopping_app/core/utils/api_services.dart';
import 'package:shopping_app/feature/Auth/domain/entities/change_password_entity.dart';
import 'package:shopping_app/feature/Auth/domain/entities/login_entity.dart';
import 'package:shopping_app/feature/Auth/domain/entities/sign_up_entity.dart';
import 'package:shopping_app/feature/Auth/data/model/user_data.dart';

abstract class AuthDataSource {
  Future<UserData> login(LoginEntity loginEntity);
  Future<UserData> signUp(SignUpEntity signUpEntity);

  Future<void> changePassword(ChangePasswordEntity passwordData);
}

class AuthDataSourceImp extends AuthDataSource {
  final ApiServices apiServices;

  AuthDataSourceImp({required this.apiServices});
  @override
  Future<UserData> login(LoginEntity loginEntity) async {
    Map<String, dynamic> data =
        await apiServices.post(endPoint: 'login', body: loginEntity.toMap());

    if (data['status'] == false) {
      throw Exception('${data['message']}');
    }
    return UserData.fromJson(data['data']);
  }

  @override
  Future<UserData> signUp(SignUpEntity signUpEntity) async {
    Map<String, dynamic> response = await apiServices.post(
        endPoint: 'register', body: signUpEntity.toJson());

    if (response['status'] == false) {
      throw Exception('${response['message']}');
    }
    return UserData.fromJson(response['data']);
  }

  @override
  Future<void> changePassword(ChangePasswordEntity passwordData) async {
    final response = await apiServices.post(endPoint: 'change-password', body: {
      'current_password': passwordData.oldPassword,
      'new_password': passwordData.newPassword
    });
  }
}
