import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/screens/nav_bar/k_bottom_navigation.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class LetsStart extends StatelessWidget {
  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
          Center(
            child: Column(children: [
              Text(AppStrings.allSetLetsGo,style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
              Text(AppStrings.newJourney,
                textAlign: TextAlign.center,
                style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
              const Image(image: AssetImage(AppImages.letsStartImg)),
            ],),
          ),
            const Spacer(),
            kTextButton(
                onPressed: (){
                  Get.offAll(()=> CustomBottomBar());
                },
                btnText: AppStrings.letsGo,
                useGradient: true
            )
        ],),
      )
    );
  }
}
