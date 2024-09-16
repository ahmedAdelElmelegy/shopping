import 'package:get/get.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/feature/settings/domain/entity/user_entity.dart';
import 'package:shopping_app/feature/settings/domain/use_case/update_profile_use_case.dart';

class UpdateProfileController extends GetxController {
  var isLoading = false.obs;
  var error = ''.obs;
  final UpdateProfileUseCase updateProfileUseCase;

  UpdateProfileController({required this.updateProfileUseCase});
  Future<void> updateProfile(UserEntity user) async {
    isLoading(true);
    try {
      var result = await updateProfileUseCase.call(user);
      result.fold(
        (failure) {
          error.value = failure.message;
        },
        (r) {
          print('Update Sucess');
        },
      );
    } finally {
      isLoading(false);
    }
  }
}
