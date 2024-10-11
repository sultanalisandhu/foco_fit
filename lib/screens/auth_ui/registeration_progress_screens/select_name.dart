import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_gender.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectName extends StatelessWidget {
  const SelectName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            2.ySpace,
          KText(text: AppStrings.whatsYourName,fontSize: 20,fontWeight: FontWeight.w700),
            3.ySpace,
          KText(text:  AppStrings.firstName,),
          5.height,
          GetTextField(
            obSecureText: false,
            context: context,
          hintText: AppStrings.enterNewPassword,),
            2.ySpace,
            KText(text: AppStrings.surName,),
            5.height,
            GetTextField(
              obSecureText: false,
              context: context,
              hintText: AppStrings.enterNewPassword,),
            const Spacer(),

        ],).paddingSymmetric(horizontal: 20,vertical: 15),
      ),

      bottomNavigationBar: kTextButton(
          onPressed: (){
            Get.to(()=>SelectGender());
          },
          btnText: AppStrings.continuue,
          useGradient: true
      ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
    );
  }
}
