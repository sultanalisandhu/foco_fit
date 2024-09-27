import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_gender.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class SelectName extends StatelessWidget {
  const SelectName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(AppStrings.whatsYourName,style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
          30.height,
          Text(AppStrings.firstName,style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
          5.height,
          GetTextField(
            obSecureText: false,
            context: context,
          hintText: AppStrings.enterNewPassword,),
            25.height,
            Text(AppStrings.surName,style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
            5.height,
            GetTextField(
              obSecureText: false,
              context: context,
              hintText: AppStrings.enterNewPassword,),
            const Spacer(),
            kTextButton(
              onPressed: (){
                Get.to(()=>SelectGender());
              },
              btnText: AppStrings.continuue,
              useGradient: true
            )
        ],).paddingSymmetric(horizontal: 20,vertical: 15),
      ),
    );
  }
}
