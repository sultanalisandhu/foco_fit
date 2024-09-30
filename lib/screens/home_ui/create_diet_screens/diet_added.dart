import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class DietAdded extends StatelessWidget {
  const DietAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: AppStrings.createFood,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: kTextButton(
          onPressed: (){
            Get.back();
            Get.back();
            Get.back();
          },
          btnText: AppStrings.confirmAndReturn,
          gradient: AppColor.blackGradient,
        ),
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Image(image: AssetImage(AppImages.greenCheckImg),height: 250,width: 250,),
              Text(AppStrings.newFoodAdded,
                textAlign: TextAlign.center,
                style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            ],).paddingSymmetric(horizontal: 25,vertical: 10)

        ],),);
  }
}
