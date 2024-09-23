import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:pinput/pinput.dart';

class GetTextField extends StatelessWidget {
  final BuildContext context;
  final String? hintText;
  final String? prefixIcon;
  final IconData? suffixIcon;

  final String? Function(String?)? validator;
  final Function()? suffixOnTap;
  final Function()? fieldOnTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? obSecureText;
  final bool? readOnly;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  const GetTextField({super.key,
    required this.context,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.controller,
    this.obSecureText,
    this.suffixOnTap,
    this.onChanged,
    this.focusNode,
    this.fieldOnTap,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly !=null ?true:false,
      validator: validator,
      controller: controller,
      cursorColor: AppColor.greyColor,
      maxLines: 1,
      style: primaryTextStyle(color: AppColor.blackColor, fontSize: 18.0,fontWeight: FontWeight.w400),
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: obSecureText??true,
      onTapOutside: (event) {context.dismissKeyBoard();},
      onChanged: onChanged,
      focusNode: focusNode,
      onTap: fieldOnTap,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child:prefixIcon!=null? showSvgIconWidget(iconPath: prefixIcon!,height: 25,width: 25):null,
        ),
        prefixIconConstraints: const BoxConstraints(
            maxHeight: 25.0,
            maxWidth: 36.0
        ),
        suffixIconConstraints: const BoxConstraints(
            maxHeight: 25.0,
            maxWidth: 36.0
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(
            suffixIcon,
            color: AppColor.greyColor,
            size: 20,
          ),
          onPressed: suffixOnTap,
        )
            : null,
       contentPadding: EdgeInsets.all( 15),
        hintStyle: primaryTextStyle(color: AppColor.greyColor, fontSize: 16.0,fontWeight: FontWeight.w400),
        filled: true,
        isDense: true,
        fillColor: Colors.transparent,
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color:AppColor.greyColor, width: 1.0),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color: AppColor.greyColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const  BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const  BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
}

class BorderlessTextFiled extends StatelessWidget {
  final BuildContext context;
  final String? hintText;
  final String? prefixText;
  final String? suffixText;
  final double? contentPadding;
  final int? maxLines;
  final Widget? suffixWidget;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? readOnly;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  const BorderlessTextFiled({super.key,
    required this.context,
    this.hintText,
    this.prefixText,
    this.suffixText,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.readOnly,
    this.suffixWidget, this.contentPadding, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly !=null ?true:false,
      controller: controller,
      cursorColor: AppColor.greyColor,
      maxLines: maxLines??1,
      style: primaryTextStyle(color: AppColor.blackColor, fontSize: 18.0,fontWeight: FontWeight.w400),
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      onTapOutside: (event) {context.dismissKeyBoard();},
      onChanged: onChanged,
      focusNode: focusNode,
      decoration: InputDecoration(
        suffix: suffixWidget,
        hintText: hintText,
        prefixText: prefixText,
        prefixStyle: primaryTextStyle(color: AppColor.blackColor, fontSize: 16.0,fontWeight: FontWeight.w400),
        suffixText: suffixText,
        suffixStyle: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.blackColor),
        prefixIconConstraints: const BoxConstraints(
            maxHeight: 25.0,
            maxWidth: 36.0
        ),
        suffixIconConstraints: const BoxConstraints(
            maxHeight: 25.0,
            maxWidth: 36.0
        ),
        contentPadding:  EdgeInsets.all(contentPadding??15),
        hintStyle: primaryTextStyle(color: AppColor.greyColor, fontSize: 16.0,fontWeight: FontWeight.w400),
        filled: true,
        isDense: true,
        fillColor: AppColor.lightGreyColor,
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color: Colors.transparent, width: 1.0),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const  BorderSide(color: Colors.transparent, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
}


class PinCodeFields extends StatefulWidget {
  final AuthController controller;
  PinCodeFields({Key? key, required this.controller}) : super(key: key);

  @override
  State<PinCodeFields> createState() => _PinCodeFieldsState();
}
class _PinCodeFieldsState extends State<PinCodeFields> {
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    focusNode = FocusNode();

  }

  @override
  void dispose() {
    // authController.pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final defaultPinTheme = PinTheme(
      width: 65,
      height: 60,
      textStyle:  primaryTextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColor.whiteColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 4,
              controller: widget.controller.pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) =>  const SizedBox(width: 12),
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 1,
                    height: 30,
                    color: AppColor.greyColor,
                  ),
                ],
              ),
              followingPinTheme:  defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.lightGreyColor),
                ),
              ),
              disabledPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.lightGreyColor),
                ),
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.greyColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  gradient: AppColor.primaryGradient,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.transparent),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

