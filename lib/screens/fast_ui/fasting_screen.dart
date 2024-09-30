import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/fasting_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/fast_ui/fasting_bottom_sheets.dart';
import 'package:focofit/screens/fast_ui/see_fasting.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class FastingScreen extends StatelessWidget {
  const FastingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
          title: AppStrings.intermittentFasting
      ),
      body: GetBuilder<FastingController>(
        init: Get.put(FastingController(),),
        tag: 'fastingController',
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Obx(
                          () => GestureDetector(
                        onTap: () => controller.selectedFasting.value = index,
                        child: _buildFastingOption(controller, index),
                      ),
                    );
                  },
                ),
              ),
              Obx(() => _buildConfirmButton(controller, context))
            ],
          ).paddingSymmetric(horizontal: 25, vertical: 15);
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
          Text(
            '12 - 12',
            style: primaryTextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          _buildDivider(),
          _buildFastingDetails(),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 2,
      height: 30,
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
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            gradient: AppColor.primaryGradient,
            shape: BoxShape.circle,
          ),
        ),
        5.width,
        Text(
          text,
          style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
            Get.to(() => SeeFasting());
          },
        );
      }
          : null,
      color: isSelectionValid ? null : AppColor.greyColor,
      useGradient: isSelectionValid,
    );
  }
}
