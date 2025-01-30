import 'package:get/get.dart';
import 'package:shopping_app/feature/home/domain/use_case/fetch_product_use_case.dart';
import 'package:shopping_app/feature/settings/domain/entity/user_entity.dart';
import 'package:shopping_app/feature/settings/domain/use_case/fetch_user_data_use_case.dart';

class FetchProfieController extends GetxController {
  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  var isLoading = false.obs;
  var error = ''.obs;
  final FetchUserDataUseCase fetchUserDataUseCase;
  UserEntity? userEntity;
  FetchProfieController({required this.fetchUserDataUseCase});

  Future<void> fetchProfile() async {
    isLoading(true);
    try {
      var result = await fetchUserDataUseCase.call();
      result.fold(
        (failure) {
          error.value = failure.message;
        },
        (profiledata) {
          userEntity = profiledata;
        },
      );
    } finally {
      isLoading(false);
    }
  }
}
