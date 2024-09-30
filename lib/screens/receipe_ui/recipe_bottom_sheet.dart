import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class KRecipeFilterSheet {
  static void show({
    required BuildContext context,
    String? title,
    required List<Widget> content,
    Function()? onConfirmTap,
    double heightFactor = 0.4,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      isScrollControlled: true,
      isDismissible: false,
      barrierColor: Colors.grey.withOpacity(0.5),
      backgroundColor: AppColor.whiteColor,
      builder: (BuildContext context) {
        return SizedBox(
          height: mQ.height * 0.9,
          width: mQ.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.isKeyboardVisible ? 30.height : 2.height,
                _buildHeader(),
                20.height,
                _buildTitle(title!),
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

  static void filter(BuildContext context, {required Function() onConfirmTap}) {
    final recipeController = Get.find<RecipeController>();

    show(
      context: context,
      title: '${AppStrings.filterBy}:',
      content: [
        Text(
          AppStrings.calories,
          style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        10.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0 ${AppStrings.kcal}', style: primaryTextStyle(fontSize: 14)),
            Obx(() => Text(
              '${recipeController.currentCalories.value.toInt()} ${AppStrings.kcal}', // Display integer value
              style: primaryTextStyle(fontSize: 14),
            )),
          ],
        ),
        Obx(() => Slider(
            value: recipeController.currentCalories.value,
            min: 0,
            max: 700,
            divisions: 7,
            activeColor: Colors.orange,
            inactiveColor: AppColor.lightGreyColor,
            onChanged: (double value) {
              recipeController.currentCalories.value = value.roundToDouble();
            },
          ),
        ),
        20.height,
        Text(
          AppStrings.snack,
          style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        10.height,
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context,index){
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.greyColor),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(AppStrings.lunch,style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
            );
          }),
        )
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.25,
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

  static Widget _buildConfirmButton(Function()? onConfirmTap) {
    return kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap,
      btnText: AppStrings.toLookFor,
      useGradient: true,
    );
  }
}
