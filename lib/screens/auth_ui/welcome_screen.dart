import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/login_screen.dart';
import 'package:focofit/screens/auth_ui/register_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Spacer(),
        Column(
          children: [
          const SizedBox(
              height: 180,
              width: 180,
              child: Image(image: AssetImage(AppImages.blackLogoImage))),
          Text(AppStrings.welcomeNote,
            style: primaryTextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600
          ),),
          Text(AppStrings.loginNote,
            style: primaryTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),),
        ],),
          const Spacer(),
          kTextButton(
            onPressed: (){
              Get.to(()=> RegisterScreen());
            },
            btnText: AppStrings.createAccount,
            useGradient: true
          ),
          5.height,
          KOutlineButton(
            onTap: (){
              Get.to(()=> LoginScreen());
            },

            btnText:AppStrings.login,
            gradient: AppColor.primaryGradient,),
      ],).paddingSymmetric(horizontal: 20,vertical: 15),
    );
  }
}
