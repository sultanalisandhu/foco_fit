import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/login_screen.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_name.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(AuthController()),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            onTap: () => Navigator.pop(context),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Text field column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        AppStrings.createYourAccount,
                        style: primaryTextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      AppStrings.email,
                      style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    5.height,
                    GetTextField(
                      context: context,
                      hintText: AppStrings.enterEmail,
                      obSecureText: false,
                      prefixIcon: AppIcons.emailIcon,
                    ),
                    15.height,
                    Text(
                      AppStrings.password,
                      style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    5.height,
                    GetTextField(
                      context: context,
                      hintText: AppStrings.enterPassword,
                      prefixIcon: AppIcons.keyBoardIcon,
                      obSecureText: c.showPassword.value,
                      suffixIcon: c.showPassword.value ? Icons.visibility : Icons.visibility_off,
                      suffixOnTap: () {
                        c.togglePassword();
                      },
                      textInputAction: TextInputAction.done,
                    ),
                    CustomRegisterCheckbox(
                      isChecked: c.isTermsAccepted,
                      onChanged: (bool value) {
                        c.isTermsAccepted.value = value;
                      },
                    ),
                    15.height,
                    kTextButton(
                      btnText: AppStrings.createAccount,
                      onPressed: () {
                        Get.to(()=> SelectName());
                      },
                      useGradient: true,
                    ),
                  ],
                ),
                30.height, // Add space between columns
                /// Button column
                Column(
                  children: [
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.alreadyHaveAccount,
                              style: primaryTextStyle(
                                color: AppColor.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            ///add on tap on this text span
                            TextSpan(
                              text: AppStrings.login,
                              style: primaryTextStyle(
                                textDecoration: TextDecoration.underline,
                                color: AppColor.startGradient,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              recognizer: TapGestureRecognizer()..onTap= (){
                                Get.offAll(()=> LoginScreen());
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
                          AppStrings.or,
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
                        btnText: AppStrings.continueWithGoogle,
                        imgPath: AppImages.googleImage
                    ),
                    kSocialButton(
                        onTap: () {},
                        btnText: AppStrings.continueWithApple,
                        imgPath: AppImages.appleImage
                    ),
                    kSocialButton(
                        onTap: () {},
                        btnText: AppStrings.continueWithFacebook,
                        imgPath: AppImages.faceBookImage
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}