import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/forgot_password/receive_otp.dart';
import 'package:focofit/screens/auth_ui/login_screen.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: kAppBar(
        onTap: () => Navigator.pop(context),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
                height: 200,
                width: 200,
                child: Image(image: AssetImage(AppImages.greenCheckImg))),
            Text(AppStrings.passwordChangedSuccessfully,style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w700),),

          ],),
      ),
      bottomNavigationBar: SizedBox(
        child:  kTextButton(
            onPressed: (){
              Get.offAll(()=> LoginScreen());
            },
            btnText: AppStrings.backAndEnter,
            useGradient: true
        ),
      ).paddingSymmetric(horizontal: 20,vertical: 10),
    );
  }
}
