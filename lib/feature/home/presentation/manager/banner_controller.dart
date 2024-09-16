import 'package:get/get.dart';
import 'package:shopping_app/core/func/sucess_register_dialog.dart';
import 'package:shopping_app/feature/home/domain/entities/banner_entity.dart';
import 'package:shopping_app/feature/home/domain/use_case/fetch_banner_use_case.dart';

class BannerController extends GetxController {
  @override
  void onInit() {
    fetchbanners();
    super.onInit();
  }

  var errorMessage = ''.obs;
  var isLoading = false.obs;

  final FetchBannerUseCase fetchBannerUseCase;

  BannerController({required this.fetchBannerUseCase});
  var banners = <BannerEntity>[];
  Future<void> fetchbanners() async {
    isLoading(true);
    try {
      var result = await fetchBannerUseCase.call();
      result.fold((failure) {
        errorMessage.value = failure.message;
        Get.snackbar('Error', failure.message);
      }, (bannerData) {
        banners = bannerData;
      });
    } catch (e) {
      errorMessage.value = 'Unexpected error occurred';
    } finally {
      isLoading(false);
    }
  }
}
