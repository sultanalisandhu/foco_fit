import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/fasting_controller.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KFastBottomSheet {
  static void show({
    required BuildContext context,
    required String title,
    required List<Widget> content,
    Function()? onConfirmTap,
    double heightFactor = 0.4,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: AppColor.whiteColor,
      builder: (BuildContext context) {
        return SizedBox(
          height: mQ.height * heightFactor,
          width: mQ.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.isKeyboardVisible ? 30.height : 2.height,
                _buildHeader(),
                1.ySpace,
                _buildTitle(title),
                const Divider(color: AppColor.greyColor),
                1.ySpace,
                ...content,
                const Spacer(),
                onConfirmTap !=null
                    ? _buildConfirmButton(onConfirmTap)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }

  static void selectTimeSheet(BuildContext context, {Function()? onConfirmTap}) {
    final fastingController = Get.put(FastingController());
    show(
      context: context,
      title: AppStrings.whenYouWantToStart,
      content: [
        Align(
            alignment: Alignment.center,
            child: Text(AppStrings.chooseTimeToStartFast,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),)),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hour ScrollView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: fastingController.hourController,
                onSelectedItemChanged: (value) {
                  fastingController.selectHour.value = value + 1;
                },
                itemExtent: 60,
                perspective: 0.009,
                diameterRatio: 2.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 12,
                  builder: (context, index) {
                    return Obx(() => Center(
                      child: index + 1 == fastingController.selectHour.value
                          ? GradientText(
                        text: (index + 1).toString(),
                        gradient: AppColor.primaryGradient,
                        style: kTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                          : Text(
                        (index + 1).toString(),
                        style: kTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ));
                  },
                ),
              ),
            ),
            KText(text: ':',fontSize: 10),
            // Min ScrollView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: fastingController.minController,
                onSelectedItemChanged: (value) {
                  fastingController.selectMin.value = value + 1;
                },
                itemExtent: 60,
                perspective: 0.009,
                diameterRatio: 2.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 60,
                  builder: (context, index) {
                    return Obx(() => Center(
                      child: index + 1 == fastingController.selectMin.value
                          ? GradientText(
                        text: (index + 1).toString(),
                        gradient: AppColor.primaryGradient,
                        style: kTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                          : Text(
                        (index + 1).toString(),
                        style: kTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.53,
    );
  }

  static void breakFastSheet(BuildContext context, {
  required Function() onConfirmTap,
    required Function() onCancelTap}) {
    show(
      context: context,
      title: AppStrings.breakYourFast,
      content: [
        Align(
            alignment: Alignment.center,
            child: KText(
              text:  AppStrings.counterWillRestAndStartAgain,
              textAlign: TextAlign.center,
            )
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           kTextButton(
               onPressed: onConfirmTap,
               useGradient: true,
               btnText: AppStrings.yesInterrupt,
             fontSize: 14
           ),
            KOutlineButton(
              onTap: onCancelTap,
              btnText: AppStrings.noContinue,
              gradient: AppColor.blackGradient,
            textGradient: AppColor.blackGradient,
              fontSize: 14,
            )

          ],
        ),
      ],
      heightFactor: 0.3,
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
      child: KText(
        text: title,
          fontSize: 17,
          fontWeight: FontWeight.w600,
      ),
    );
  }


  static Widget _buildConfirmButton(Function()? onConfirmTap) {
    return kTextButton(
      height: 5,
      fontSize: 14,
      width: mQ.width,
      onPressed: onConfirmTap!,
      btnText: AppStrings.confirmTime,
      useGradient: true,
    );
  }
}
