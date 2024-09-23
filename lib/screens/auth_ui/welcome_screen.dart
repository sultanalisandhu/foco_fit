import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/screens/auth_ui/login_screen.dart';
import 'package:focofit/screens/auth_ui/register_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Spacer(),
          Center(
            child: Column(
              children: [
              const SizedBox(
                  height: 180,
                  width: 180,
                  child: Image(image: AssetImage(AppImages.blackLogoImage))),
              Text('Bem-vindo(a) ao FocoFit',
                style: primaryTextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600
              ),),
              Text('Entre ou crie uma conta',
                style: primaryTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
            ],),
          ),
            const Spacer(),

            kTextButton(
              onPressed: (){
                Get.to(()=> RegisterScreen());
              },
              btnText: 'Criar conta',
              useGradient: true
            ),
            SizedBox(
              height: 5,
            ),
            KOutlineButton(
              onTap: (){
                Get.to(()=> LoginScreen());
              },
              btnText:'Entrar',
              gradient: AppColor.primaryGradient,),
            SizedBox(
              height: 25,
            ),
        ],),
      ),
    );
  }
}
