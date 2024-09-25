import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/register_screen.dart';
import 'package:focofit/screens/nav_bar/k_bottom_navigation.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: Get.put(AuthController()),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            onTap: () => Navigator.pop(context),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Entre na sua conta',
                    style: primaryTextStyle(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  'Email',
                  style: primaryTextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                5.height,
                GetTextField(
                  context: context,
                  hintText: 'Digite seu email',
                  obSecureText: false,
                  prefixIcon: AppIcons.emailIcon,
                ),
                15.height,
                Text(
                  'Senha',
                  style: primaryTextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                5.height,
                GetTextField(
                  context: context,
                  hintText: 'Digite sua senha',
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
                CustomCheckbox(
                  isChecked: c.isTermsAccepted,
                  onChanged: (bool value) {
                    c.isTermsAccepted.value = value;
                  },
                ),
                15.height,
                kTextButton(
                  btnText: 'Entrar',
                  onPressed: () {
                    Get.offAll(()=> CustomBottomBar());
                  },
                  useGradient: true,
                ),
                50.height,
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Não tem uma conta ainda? ',
                          style: primaryTextStyle(
                            color: AppColor.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Criar conta',
                          style: primaryTextStyle(
                            textDecoration: TextDecoration.underline,
                            color: AppColor.startGradient,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          recognizer: TapGestureRecognizer()..onTap= (){
                            Get.offAll(()=> RegisterScreen());
                          }
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        height: 60,
                        color: AppColor.greyColor,
                        endIndent: 20,
                        indent: 20,
                      ),
                    ),
                    Text(
                      'OU',
                      style: primaryTextStyle(
                        color: AppColor.greyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColor.greyColor,
                        endIndent: 20,
                        indent: 20,
                      ),
                    ),
                  ],
                ),
                kSocialButton(
                  onTap: () {},
                  btnText: 'Continuar com Google',
                  imgPath: AppImages.googleImage
                ),
                kSocialButton(
                  onTap: () {},
                  btnText: 'Continuar com Apple',
                    imgPath: AppImages.appleImage
                ),
                kSocialButton(
                  onTap: () {},
                  btnText: 'Continuar com Facebook',
                    imgPath: AppImages.faceBookImage
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
