import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
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

  // Method to show bottom sheet for editing email
  static void editEmail(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: 'Alterar email',
      content: [
        _buildTextField(label: "Novo email", hintText: 'Novo email', context: context),
        10.height,
        _buildTextField(label: "Confirme o email", hintText: 'Confirme o email', context: context),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.4,
    );
  }

  // Method to show bottom sheet for editing password
  static void editPassword(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: 'Alterar senha',
      content: [
        _buildTextField(label: "Senha antiga", hintText: 'Senha antiga', context: context),
        10.height,
        _buildTextField(label: "Novo senha", hintText: 'Novo senha', context: context),
        10.height,
        _buildTextField(label: "Confirme a senha", hintText: 'Confirme a senha', context: context),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.5,
    );
  }

  // Method to show bottom sheet for editing phone number
  static void editPhone(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: 'Alterar celular',
      content: [
        _buildTextField(hintText: '(16) 99999-9999', context: context),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.4,
    );
  }

  // Helper method for header
  static Widget _buildHeader() {
    return Align(
      alignment: Alignment.center,
      child: showSvgIconWidget(iconPath: AppIcons.dashIcon),
    );
  }

  // Helper method for title
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

  // Helper method to build text fields
  static Widget _buildTextField({
    required BuildContext context,
    String? label,
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
        GetTextField(
          context: context,
          hintText: hintText,
          obSecureText: false,
        ),
      ],
    );
  }

  // Helper method for confirm button
  static Widget _buildConfirmButton(Function()? onConfirmTap) {
    return kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap!,
      btnText: 'Salvar',
      useGradient: true,
    );
  }
}
