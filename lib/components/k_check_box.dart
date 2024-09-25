import 'package:flutter/material.dart';
import 'package:focofit/screens/auth_ui/forgot_password/forgot_password.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatelessWidget {
  final Color? chkBorderColor;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.chkBorderColor,
  });
  final RxBool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked.value,
          onChanged: (bool? value) {
            isChecked.value = value!;
            onChanged(isChecked.value);
          },
          checkColor: Colors.white,
          activeColor: AppColor.startGradient,
          side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(
              color: states.contains(MaterialState.selected)
                  ? AppColor.startGradient
                  : chkBorderColor ?? AppColor.greyColor,
              width: 1.5,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
          Text(
            "Lembrar de mim",
            style: primaryTextStyle(
              fontSize: 14.0,
              color: AppColor.blackColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          GradientText(
            text: "Esqueceu a senha?",
            onTextTap: (){
              Get.to(()=> ForgotPassword());
            },
            gradient: AppColor.primaryGradient,
            style: primaryTextStyle(
              fontSize: 14.0,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    ));
  }
}

class CustomSwitchTile extends StatelessWidget {
  final RxBool value;
  final Function(bool) onChanged;
  final String title;
  const CustomSwitchTile({super.key, required this.value, required this.onChanged, required this.title});

  @override
  Widget build(BuildContext context) {
    return Obx(()=> SwitchListTile(
        value: value.value,
        onChanged: onChanged,
        title: Text(title,style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
        shape: RoundedRectangleBorder(side: const BorderSide(color: AppColor.greyColor),borderRadius: BorderRadius.circular(10)),
        activeTrackColor: AppColor.startGradient,
        activeColor: AppColor.whiteColor,
        inactiveTrackColor: AppColor.greyColor.withOpacity(0.4),
        inactiveThumbColor: AppColor.whiteColor,
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
    );
  }
}
