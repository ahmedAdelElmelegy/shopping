import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/utils/api_services.dart';
import 'package:shopping_app/feature/Auth/data/Auth_Repo_imp/auth_repo_imp.dart';
import 'package:shopping_app/feature/Auth/data/data_Source/Auth_data_source.dart';
import 'package:shopping_app/feature/Auth/domain/use_case/change_password_use_case.dart';
import 'package:shopping_app/feature/Auth/domain/use_case/login_use_case.dart';
import 'package:shopping_app/feature/Auth/domain/use_case/sign_up_use_case.dart';
import 'package:shopping_app/feature/Auth/presentation/manager/change_password_controller.dart';
import 'package:shopping_app/feature/Auth/presentation/manager/login_controller.dart';
import 'package:shopping_app/feature/Auth/presentation/manager/sign_up_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      fenix: true,
      () => SignUpController(
        signUpUseCase: SignUpUseCase(
          authRepo: AuthRepoImp(
            authDataSource: AuthDataSourceImp(
              apiServices: ApiServices(
                Dio(),
              ),
            ),
          ),
        ),
      ),
    );
    Get.lazyPut(
      fenix: true,
      () => LoginController(
        loginUseCase: LoginUseCase(
          authRepo: AuthRepoImp(
            authDataSource: AuthDataSourceImp(
              apiServices: ApiServices(
                Dio(),
              ),
            ),
          ),
        ),
      ),
    );
    Get.lazyPut(
      fenix: true,
      () => ChangePasswordController(
        changePasswordUseCase: ChangePasswordUseCase(
          authRepo: AuthRepoImp(
            authDataSource: AuthDataSourceImp(
              apiServices: ApiServices(
                Dio(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
