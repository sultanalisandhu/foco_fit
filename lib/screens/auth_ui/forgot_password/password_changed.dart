import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/forgot_password/receive_otp.dart';
import 'package:focofit/screens/auth_ui/login_screen.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
        init: Get.put(AuthController()),
        builder: (c) {
          return Scaffold(
            appBar: kAppBar(
              onTap: () => Navigator.pop(context),
            ),
            body:Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const SizedBox(
                      height: 150,
                      width: 150,
                      child: Image(image: AssetImage(AppImages.blueTickImg))),
                  Text('Senha alterada com sucesso!',style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                  Text('Sua nova senha foi salva com sucesso. Agora você pode entrar na sua conta novamente e continuar o seu progresso.',
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                  20.height,
                  const Spacer(),
                  kTextButton(
                      onPressed: (){
                        Get.offAll(()=> LoginScreen());
                      },
                      btnText: 'Voltar e entrar',
                      useGradient: true
                  )
                ],),
            ),
          );
        }
    );
  }
}
