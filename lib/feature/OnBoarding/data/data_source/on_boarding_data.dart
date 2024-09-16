import 'package:shopping_app/core/assets/image/assets.dart';
import 'package:shopping_app/feature/OnBoarding/data/model/on_boarding_model.dart';

class OnBoardingData {
  static List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
      image: Assets.imagesOnboarding1,
      title: 'Define yourself in',
      subtitle: 'your',
      titleprimary: 'unique way',
    ),
    OnBoardingModel(
      image: Assets.imagesOnboarding2,
      title: 'Find the best ',
      subtitle: 'for you',
      titleprimary: 'fashion styl',
    ),
    OnBoardingModel(
        image: Assets.imagesOnboarding3,
        title: 'Start Discover your',
        subtitle: 'style',
        titleprimary: 'unique fashion')
  ];
}
