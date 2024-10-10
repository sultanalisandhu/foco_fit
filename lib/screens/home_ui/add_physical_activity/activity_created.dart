import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ActivityAdded extends StatelessWidget {
  const ActivityAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: AppStrings.createPhysicalActivity,
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Image(image: AssetImage(AppImages.greenCheckImg),height: 250,width: 250,),
              KText(text:  AppStrings.newFoodAdded,
                textAlign: TextAlign.center,
                fontSize: 16,fontWeight: FontWeight.w400).paddingSymmetric(horizontal: 8.w,),
            ],)
        ],),
      bottomNavigationBar: kTextButton(
        onPressed: (){
          Get.back();
          Get.back();
          Get.back();
          Get.back();
          Get.back();
        },
        btnText: AppStrings.confirmAndReturn,
        gradient: AppColor.blackGradient,
      ).paddingSymmetric(horizontal: 6.w,vertical: 3.h),
    );
  }
}
