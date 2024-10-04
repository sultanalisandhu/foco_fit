import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CalorieGoalScreen extends StatelessWidget {
  CalorieGoalScreen({super.key});
  final ProfileController c = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: AppStrings.calorieGoal,
      ),
      body: Column(
        children: [
          CustomSwitchTile(
            value: c.recalculateCalorieLimit,
            onChanged: (v) {
              c.recalculateCalorieLimit.value = v;
            },
            title: AppStrings.automaticallyRecalculateLimit,
          ),
          15.height,
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context,index){
              return Obx(() {
                final bool isActive = !c.recalculateCalorieLimit.value;
                return Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: isActive ? AppColor.greyBorder : AppColor.greyColor.withOpacity(0.4)),
                    color: isActive ? Colors.white : AppColor.lightGreyColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(text: AppStrings.breakFast,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.black : AppColor.greyColor,
                      ),
                      15.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _calorieDetailBox(isActive: isActive, text: '28', unit: 'Kcal'),
                          _calorieDetailBox(isActive: isActive, text: '1200', unit: 'Kcal'),
                        ],
                      ),
                    ],
                  ),
                );
              });
            }),
          )
        ],
      ).paddingSymmetric(horizontal: 4.w,vertical: 2.h),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: kTextButton(
          onPressed: () {},
          btnText: AppStrings.save,
          useGradient: true,
        ),
      ),
    );
  }
  Widget _calorieDetailBox({required bool isActive,required String text,required String unit}){
    return  Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: isActive
                    ? AppColor.greyBorder
                    : AppColor.greyColor.withOpacity(0.4)),
          ),
          child:
          KText(text: text,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.black : AppColor.greyColor,
          ),
        ),
        5.width,
        KText(text: unit,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.black : AppColor.greyColor,
        ),
      ],
    );
  }
}
