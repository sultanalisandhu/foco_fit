import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/forgot_password/password_changed.dart';
import 'package:focofit/screens/auth_ui/forgot_password/receive_otp.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
              children: [
                const SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(image: AssetImage(AppImages.changePasswordImg))),
                Text('Recupere sua conta',style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                Text('Crie uma nova senha para recuperar o acesso à sua conta',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                20.height,
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Nova senha',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                10.height,
                GetTextField(
                  context: context,
                  hintText: 'Digite sua nova senha',
                  prefixIcon: AppIcons.keyBoardIcon,
                  obSecureText: c.showPassword.value,
                  suffixIcon: c.showPassword.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  suffixOnTap: () {
                    c.togglePassword();
                  },
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Confirme a senha',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                10.height,
                GetTextField(
                  context: context,
                  hintText: 'Digite sua nova senha',
                  prefixIcon: AppIcons.keyBoardIcon,
                  obSecureText: c.showPassword.value,
                  suffixIcon: c.showPassword.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  suffixOnTap: () {
                    c.togglePassword();
                  },
                  textInputAction: TextInputAction.done,
                ),
                const Spacer(),
                kTextButton(
                    onPressed: (){
                      Get.to(()=> PasswordChanged());
                    },
                    btnText: 'Continuar',
                    useGradient: true
                )
              ],),
          ),
        );
      }
    );
  }
}
