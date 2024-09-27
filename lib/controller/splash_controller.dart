import 'package:flutter/material.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:get/get.dart';

import '../screens/auth_ui/onboarding_screen.dart';

class SplashController extends GetxController{

  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;



  final List<String> images = [
    AppImages.onboardingImage1,
    AppImages.onboardingImage2,
    AppImages.onboardingImage3,
  ];
  final List<String> tittleText = [
    AppStrings.onboardingTitle1,
    AppStrings.onboardingTitle2,
    AppStrings.onboardingTitle3,
  ];
  final List<String> subTitleText = [
    AppStrings.onboardingSubTitle1,
    AppStrings.onboardingSubTitle2,
    AppStrings.onboardingSubTitle3,
  ];

  ///Functions
  Future<void> navigateTo() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(()=> KOnboardingScreen());
    });
  }
}