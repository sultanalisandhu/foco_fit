import 'package:focofit/screens/auth_ui/onboarding_screen.dart';
import 'package:get/get.dart';


class SplashController extends GetxController{


  ///Functions
  Future<void> navigateTo() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(()=> KOnboardingScreen());
    });
  }

  @override
  void onInit() {
    super.onInit();
    navigateTo();
  }
}