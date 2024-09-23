import 'package:flutter/material.dart';
import 'package:focofit/controller/splash_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controller= Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    controller.navigateTo();
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: AppColor.primaryGradient
        ),
        child: Center(
            child: Image(image: AssetImage(AppImages.logoImage))
        ),
      )

    );
  }
}
