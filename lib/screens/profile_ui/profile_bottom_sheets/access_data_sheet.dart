import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

class KBottomSheet {
  // Common method to show the bottom sheet
  static void show({
    required BuildContext context,
    required String title,
    required List<Widget> content,
    required Function()? onConfirmTap,
    double heightFactor = 0.4,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: AppColor.whiteColor,
      builder: (BuildContext context) {
        return SizedBox(
          height: context.isKeyboardVisible ? mQ.height : mQ.height * heightFactor,
          width: mQ.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.isKeyboardVisible ? 30.height : 2.height,
                _buildHeader(),
                20.height,
                _buildTitle(title),
                10.height,
                ...content,
                const Spacer(),
                _buildConfirmButton(onConfirmTap),
              ],
            ),
          ),
        );
      },
    );
  }

  static void editEmail(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.changeEmail,
      content: [
        _buildTextField(context: context, label: AppStrings.newEmail, hintText: AppStrings.newEmail, ),
        10.height,
        _buildTextField(context: context, label: AppStrings.confirmEmail, hintText: AppStrings.confirmEmail,textInputAction: TextInputAction.done ),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.4,
    );
  }

  static void editPassword(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.changePassword,
      content: [
        _buildTextField(label: AppStrings.oldPassword, hintText: AppStrings.oldPassword, context: context),
        10.height,
        _buildTextField(label: AppStrings.newPassword, hintText: AppStrings.newPassword, context: context),
        10.height,
        _buildTextField(label: AppStrings.confirmPassword, hintText: AppStrings.confirmPassword, context: context,textInputAction: TextInputAction.done),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.5,
    );
  }

  static void editPhone(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.changeCellPhone,
      content: [
        _buildTextField(hintText: '(16) 99999-9999', context: context,textInputAction: TextInputAction.done),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.35,
    );
  }

  static Widget _buildHeader() {
    return Align(
      alignment: Alignment.center,
      child: showSvgIconWidget(iconPath: AppIcons.dashIcon),
    );
  }

  static Widget _buildTitle(String title) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: primaryTextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget _buildTextField({
    required BuildContext context,
    String? label,
    TextInputAction? textInputAction,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label,
            textAlign: TextAlign.center,
            style: primaryTextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
    CustomTextField(context: context,
    hintText: hintText,
      color: Colors.white,
      borderColor: AppColor.greyColor,
      textInputType: TextInputType.text,
      textInputAction: textInputAction,
    ),
      ],
    );
  }

  static Widget _buildConfirmButton(Function()? onConfirmTap) {
    return kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap!,
      btnText: AppStrings.save,
      useGradient: true,
    );
  }
}
