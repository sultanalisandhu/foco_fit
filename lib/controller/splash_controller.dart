import 'package:flutter/material.dart';
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
    'Seja bem-vindo(a)\nà sua jornada fitness',
    'Fique em forma.\nViva saudável.',
    'Fique em forma.\nViva saudável.',
  ];
  final List<String> subTitleText = [
    'Registre tudo o que você come\ne acompanhe seus resultados',
    'Sua jornada fitness começa aqui',
    'Sua jornada fitness começa aqui',
  ];

  ///Functions
  Future<void> navigateTo() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(()=> KOnboardingScreen());
    });
  }
}