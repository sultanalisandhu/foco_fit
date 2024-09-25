import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/forgot_password/receive_otp.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              child: Image(image: AssetImage(AppImages.forgotImage))),
          Text('Esqueceu a senha?',style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
          Text('Digite seu email abaixo para receber um link e resetar sua senha',
            textAlign: TextAlign.center,
            style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
          20.height,
          Align(
              alignment: Alignment.topLeft,
              child: Text('Email',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
          10.height,
          GetTextField(
            context: context,
            hintText: 'Digite seu email',
            obSecureText: false,
            prefixIcon: AppIcons.emailIcon,
            textInputAction: TextInputAction.done,
          ),
          const Spacer(),
          kTextButton(
            onPressed: (){
              Get.to(()=> OtpScreen());
            },
            btnText: 'Continuar',
            useGradient: true
          )
        ],),
      ),
    );
  }
}
