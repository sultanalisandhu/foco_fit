import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/fasting_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_bottom_sheets/fasting_bottom_sheets.dart';
import 'package:focofit/screens/fast_ui/see_fasting.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FastingScreen extends StatelessWidget {
  const FastingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: AppStrings.intermittentFasting,
      ),
      body: GetBuilder<FastingController>(
        init: Get.put(FastingController()),
        tag: 'fastingController',
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Obx(() => GestureDetector(
                          onTap: () => controller.selectedFasting.value = index,
                          child: _buildFastingOption(controller, index),
                        ));
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0), // Adjust the blur strength here
                          child: Container(
                            color: AppColor.whiteColor.withOpacity(0.3), // Adjust opacity for better visibility
                          ),
                        ),
                      ),
                    )                  ],
                ),
              ),
              Obx(() => _buildConfirmButton(controller, context)),
              2.ySpace

            ],
          ).paddingSymmetric(horizontal: 2.h, vertical: 0.5.h);
        },
      ),
    );
  }


  Widget _buildFastingOption(FastingController controller, int index) {
    final isSelected = controller.selectedFasting.value == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColor.startGradient : AppColor.greyBorder,
        ),
        boxShadow: const [AppColor.shadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const KText(
            text: '12 - 12',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          _buildDivider(),
          _buildFastingDetails(),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 0.5.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: AppColor.greyColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildFastingDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFastingRow('12 ${AppStrings.fastingHours}'),
        _buildFastingRow('12 ${AppStrings.hoursEating}'),
      ],
    );
  }

  Widget _buildFastingRow(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 2.h,
          width: 2.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColor.primaryGradient,
          ),
        ),
        2.xSpace,
        KText(
          text: text,
          fontSize: 16,
        ),
      ],
    );
  }

  Widget _buildConfirmButton(FastingController controller, BuildContext context) {
    final isSelectionValid = controller.selectedFasting.value != -1;
    return kTextButton(
      btnText: AppStrings.confirmSelection,
      onPressed: isSelectionValid
          ? () {
        KFastBottomSheet.selectTimeSheet(
          context,
          onConfirmTap: () {
            Navigator.pop(context);
            Get.to(() => SeeFasting());
          },
        );
      }
          : null,
      color: isSelectionValid ? null : AppColor.greyColor,
      useGradient: isSelectionValid,
      fontSize: 16,
    );
  }
}
