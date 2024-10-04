import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/search_recipe_manually.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/models/k_models/home_data.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/recipe_widgets/k_circular_progress_bar.dart';
import 'package:get/get.dart';

class KHomeBottomSheet {
  // Common method to show the bottom sheet
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
                const Divider(color: AppColor.greyColor),
                10.height,
                ...content,
                const Spacer(),
                onConfirmTap!=null?
                _buildConfirmButton(onConfirmTap):const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }



  static void quickRegistration(BuildContext context, {required Function() onExerciseTap, required Function() onSnackTap}) {
    show(
      context: context,
      title: AppStrings.quickRegistration,
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onExerciseTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyBorder),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Image.asset(AppImages.dumbellImg,height: 50,width: 50,),
                    Text(AppStrings.exercise,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: onSnackTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyBorder),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Image.asset(AppImages.choclateImg,height: 50,width: 50,),
                    Text(AppStrings.snack,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            ),
          ],
        )
      ],
      heightFactor: 0.28,
    );
  }

  static void snackRegisterSheet(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.quickMealLog,
      content: [
        Text(AppStrings.foodName,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        CustomTextField(context: context,hintText: AppStrings.carrotCake,textInputType: TextInputType.text,),
        10.height,
        Text(AppStrings.calories,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        CustomTextField(context: context,prefixText: AppStrings.calories,suffixText: AppStrings.kcal,textDirection: TextDirection.ltr,),
        10.height,
        Text(AppStrings.carbohydrateOptional,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        CustomTextField(context: context,prefixText: AppStrings.carbohydrates,suffixText: AppStrings.grams,textDirection: TextDirection.ltr,),
        10.height,
        Text(AppStrings.proteinsOptional,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        CustomTextField(context: context,prefixText: AppStrings.proteins,suffixText: AppStrings.grams,textDirection: TextDirection.ltr,),
        10.height,
        Text(AppStrings.fatOptional,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        CustomTextField(context: context,prefixText: AppStrings.fats,suffixText: AppStrings.grams,textDirection: TextDirection.ltr,textInputAction: TextInputAction.done,),
      ],
      onConfirmTap: onConfirmTap!,
      heightFactor: 0.7,
    );
  }

  static void exerciseRegisterSheet(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.quickExerciseLog,
      content: [
        Text(AppStrings.activityName,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        CustomTextField(context: context,hintText: AppStrings.exRace,textInputType: TextInputType.text,),
        10.height,
        Text(AppStrings.calories,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        CustomTextField(context: context,prefixText: AppStrings.calories,suffixText: AppStrings.kcal,textDirection: TextDirection.ltr,),
        10.height,
        Text(AppStrings.duration,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        CustomTextField(context: context,prefixText: AppStrings.duration,suffixText: AppStrings.min,textDirection: TextDirection.ltr,textInputAction: TextInputAction.done,),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.55,
    );
  }

  static void confirmationSheet(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.quickMealLog,
      content: [
        const Image(image: AssetImage(AppImages.greenCheckImg)),
        Align(
          alignment: Alignment.center,
          child: Text(AppStrings.exerciseRegistered,
            style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
        ),
      ],
      onConfirmTap: onConfirmTap!,
      heightFactor: 0.65,
    );
  }

  static void recordMeal(BuildContext context) {
    show(
      context: context,
      title: AppStrings.recordMeal,
      content: [
        SizedBox(
          height: mQ.height*0.15,
          child: ListView.builder(
            itemCount: registerRecipeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Obx(() => GestureDetector(
                onTap: () {
                  if(index==0){
                    Get.back();
                    Get.to((()=> SearchRecipeManually()));
                  }else{
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.greyColor,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(registerRecipeList[index].iconPath.toString()),
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        registerRecipeList[index].title.toString(),
                        textAlign: TextAlign.center,
                        style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ));
            },
          ),
        ),
      ],
      heightFactor: 0.35,
    );
  }

  static void addCalories(BuildContext context) {
    show(
      context: context,
      title: AppStrings.registerBreakFast,
      content: [
        Align(
            alignment: Alignment.center,
            child: Text(AppStrings.sweetRice,style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
        10.height,
        Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(
              children: [
            TextSpan(text: '0', style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            TextSpan(text: 'Kcal', style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600)),
          ])),
        ),
        15.height,
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          KCircularProgressBar(consumed: '0', dietName: AppStrings.carbohydrate, lineGradient: AppColor.greenGradient, progressValue: 0.2),
          KCircularProgressBar(consumed: '0', dietName: AppStrings.protein, lineGradient: AppColor.redGradient, progressValue: 0.2),
          KCircularProgressBar(consumed: '0', dietName: AppStrings.fat, lineGradient: AppColor.primaryGradient, progressValue: 0.2),
        ],),
        15.height,
        CustomTextField(
          context: context,
          prefixText: '${AppStrings.amount}:',
          suffixText: AppStrings.grams,
          color: AppColor.whiteColor,borderColor: AppColor.lightGreyColor,
          textDirection: TextDirection.ltr,
          textInputAction: TextInputAction.done,
        ),
      ],
      onConfirmTap: (){Get.back();},
      heightFactor: 0.55,
    );
  }

  static void addPhysicalActivity(BuildContext context) {
    show(
      context: context,
      title: AppStrings.recordPhysicalActivity,
      content: [
        Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(text: '0 ', style: primaryTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    TextSpan(text: AppStrings.kcal, style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600)),
                  ])),
        ),
        15.height,
        CustomTextField(
          context: context,
          controller: TextEditingController(),
          prefixText: '${AppStrings.duration}:',
          suffixText: AppStrings.min,
          textDirection: TextDirection.ltr,
          textInputAction: TextInputAction.done,
        ),
      ],
      onConfirmTap: (){},
      heightFactor: 0.4,
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
      onPressed: onConfirmTap!,
      btnText: AppStrings.save,
      useGradient: true,
    );
  }
}
