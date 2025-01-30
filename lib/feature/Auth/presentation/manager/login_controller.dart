import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/feature/Auth/domain/entities/login_entity.dart';
import 'package:shopping_app/feature/Auth/domain/use_case/login_use_case.dart';
import 'package:shopping_app/feature/home/presentation/bindings/home_bindings.dart';
import 'package:shopping_app/feature/main_screen/presentation/view/main_screen_view.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});
  Future<void> login({required String email, required String password}) async {
    try {
      isLoading(true);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      LoginEntity loginEntity = LoginEntity(email: email, password: password);
      var result = await loginUseCase.call(loginEntity);
      result.fold(
        (failure) => Get.snackbar("Error", failure.message),
        (userData) {
          sharedPreferences.setString('token', userData.token);
          Get.offAll(
            () => MainScreenView(),
            binding: HomeBindings(),
          );
        },
      );
    } catch (e) {
      Get.snackbar('Error', '$e');
    } finally {
      isLoading(false);
    }
  }

  var isHint = true.obs;
  void isObsecure() {
    isHint.value = !isHint.value;
  }
}
