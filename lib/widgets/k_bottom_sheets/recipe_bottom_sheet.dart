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
import 'package:responsive_sizer/responsive_sizer.dart';

class KRecipeBottomSheets {
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
          height: mQ.height * heightFactor,
          width: mQ.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

  static void filter(BuildContext context, {required Function() onConfirmTap,required RecipeController recipeController}) {

    show(
      context: context,
      title: '${AppStrings.filterBy}:',
      content: [
        KText(text: AppStrings.calories, fontWeight: FontWeight.w600
        ),
        1.ySpace,
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
        2.ySpace,
        KText(text:AppStrings.snack,fontWeight: FontWeight.w600
        ),
        1.ySpace,
        SizedBox(
          height: 4.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context,index){
            return Obx(()=>GestureDetector(
                onTap: (){
                  recipeController.selectedSnack.value = index;
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: recipeController.selectedSnack.value == index? AppColor.startGradient : AppColor.lightGreyBorder,
                        width: recipeController.selectedSnack.value == index? 1.5 : 1
                    ),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: KText(text:  AppStrings.lunch,fontSize: 14,),
                ),
              ),
            );
          }),
        ),
        2.ySpace,
        KText(text: AppStrings.diets,fontWeight: FontWeight.w600
        ),
        1.ySpace,
        Wrap(
          spacing: 1.w,
          runSpacing: 1.h,
          children: List.generate(4, (index) {
            return Obx(() => GestureDetector(
              onTap: () {
                recipeController.selectedDiet.value = index;
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                width: 25.w,
                height: 4.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: recipeController.selectedDiet.value == index
                        ? AppColor.startGradient
                        : AppColor.lightGreyBorder,
                    width: recipeController.selectedDiet.value == index ? 1.5 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: KText(text: AppStrings.vegetarian,fontSize: 13,),
              ),
            ));
          }),
        ),
        2.ySpace,
        KText(text: AppStrings.difficultyInPreparation,fontWeight: FontWeight.w600
        ),
        1.ySpace,
        SizedBox(
          height: 4.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context,index){
                return Obx(()=>GestureDetector(
                  onTap: (){
                    recipeController.selectedDifficulty.value = index;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: recipeController.selectedDifficulty.value == index? AppColor.startGradient : AppColor.lightGreyBorder,
                            width: recipeController.selectedDifficulty.value == index? 1.5 : 1
                        ),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: KText(text:  AppStrings.lunch,fontSize: 14,),
                  ),
                ),
                );
              }),
        ),
        2.ySpace,
        KText(text:
          AppStrings.preparationTime,fontWeight: FontWeight.w600
        ),
        1.ySpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KText(text:  '5 ${AppStrings.min}',fontSize: 14),
            Obx(() => KText(text: '${recipeController.currentTime.value.toInt()} ${AppStrings.min}',
              fontSize: 14
            )),
          ],
        ),
        Obx(() => Slider(
          value: recipeController.currentTime.value,
          min: 0,
          max: 90,
          divisions: 5,
          activeColor: Colors.orange,
          inactiveColor: AppColor.lightGreyColor,
          onChanged: (double value) {
            recipeController.currentTime.value = value.roundToDouble();
          },
        ),
        ),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 1,
    );
  }


  static void addQuantityType(BuildContext context, {Function()? onConfirmTap, required RecipeController c}) {
    RxInt tempSelectedIndex = 0.obs;

    show(
      context: context,
      title: AppStrings.selectTheMeasurement,
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.75,
              child: ListWheelScrollView.useDelegate(
                controller: c.quantityController,
                onSelectedItemChanged: (value) {
                  tempSelectedIndex.value = value;
                },
                itemExtent: 65,
                perspective: 0.006,
                diameterRatio: 1.6,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: c.quantityTypeList.length,
                  builder: (context, index) {
                    return Obx(()=>Center(
                      child: index == tempSelectedIndex.value
                          ? GradientText(
                        text: c.quantityTypeList[index],
                        gradient: AppColor.primaryGradient,
                        style: primaryTextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                          : Text(
                        c.quantityTypeList[index],
                        style: primaryTextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
      onConfirmTap: () {
        FocusScope.of(context).unfocus();
        c.selectedQuantityType.value = c.quantityTypeList[tempSelectedIndex.value];
        print('Selected Quantity Type: ${c.selectedQuantityType.value}');

        Navigator.pop(context);
        if (onConfirmTap != null) {
          onConfirmTap();
        }
      },
      heightFactor: 0.45,
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
