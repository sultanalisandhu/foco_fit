import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/forgot_password/change_password.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init:  Get.put(AuthController()),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            onTap: () => Navigator.pop(context),
          ),
          body:Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(image: AssetImage(AppImages.otpImg))),
                Text(AppStrings.enterVerificationCode,style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                Text(AppStrings.enterCodeSentByEmail,
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                2.ySpace,
                PinCodeFields(controller: c,),
                const Spacer(),
                kTextButton(
                    onPressed: (){
                      Get.to(()=> ChangePassword());
                    },
                    btnText: AppStrings.continuue,
                    useGradient: true
                )
              ],),
          ),
        );
      }
    );
  }
}
