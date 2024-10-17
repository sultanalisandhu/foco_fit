import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/recipe_widgets/k_circular_progress_bar.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecipeController>(
      init: Get.find<RecipeController>(tag: 'recipeController'),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            onTap: (){
              Navigator.pop(context);
            },
            title: AppStrings.recipes
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: mQ.width,
                  height: 30.h,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://img.freepik.com/free-photo/top-view-delicious-meat-soup-with-greens-potatoes-dark-desk_140725-76538.jpg'
                        '?t=st=1726805819~exp=1726809419~hmac=b234032ec44036bfc4edc3d5461b1ca9f8f990ad13408b60b86eb31e19e95ca9&w=1380')),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: KText(text: '10 ${AppStrings.min}',fontWeight: FontWeight.w500,),
                          ),
                          5.width,
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: KText(text: '329 ${AppStrings.kcal}',fontWeight: FontWeight.w500,),
                          ),

                          const Spacer(),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration:  BoxDecoration(
                                color: AppColor.whiteColor.withOpacity(0.8),
                                shape: BoxShape.circle,
                              ),
                              child: LikeButton(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
            2.ySpace,
            KText(text:  AppStrings.smokedSalmon,fontSize: 16,fontWeight: FontWeight.w600),
                4.ySpace,
                //MacroNutrients  ---------------------------------------------------
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.greyBorder),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      AppColor.shadow
                    ],
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        showSvgIconWidget(iconPath: AppIcons.outlineChartIcon,color: AppColor.blackColor),
                        5.width,
                        KText(text:  AppStrings.macronutrients,fontSize: 16,fontWeight: FontWeight.w600),
                      ],
                    ).paddingSymmetric(horizontal: 15),
                    3.ySpace,
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: KCircularProgressBar(
                                consumed: '190',
                                dietName: AppStrings.carbohydrates,
                                lineGradient: AppColor.greenGradient,
                                progressValue: 0.6,
                                radius: 6.h,
                              ),
                            ),
                            10.xSpace,
                            Expanded(
                              child: KCircularProgressBar(
                                consumed: '90',
                                dietName: AppStrings.proteins,
                                lineGradient: AppColor.redGradient,
                                progressValue: 0.4,
                                radius: 6.h,
                              ),
                            ),
                            10.xSpace,
                            Expanded(
                              child: KCircularProgressBar(
                                consumed: '169',
                                dietName: AppStrings.fats,
                                lineGradient: AppColor.primaryGradient,
                                progressValue: 0.3,
                                radius: 6.h,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 25),
                  ],),
                ),
                3.ySpace,
                //Ingredients  ---------------------------------------------------
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.greyBorder),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      AppColor.shadow
                    ],
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        showSvgIconWidget(iconPath: AppIcons.ingredientesIcon),
                        5.width,
                        KText(text:  AppStrings.ingredients,fontSize: 16,fontWeight: FontWeight.w600),
                      ],
                    ),
                    2.ySpace,
                    ListView.builder(
                        itemCount: c.ingredients.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                      return SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // ingredient name
                          KText(text: c.ingredients[index].name.toString(),fontSize: 16),
                          const Expanded(child: Text('---------------------------------------------------------------------------------',maxLines: 1,)),
                          KText(text: c.ingredients[index].quantity.toString(),fontSize: 16),
                        ],),
                      );
                    })
                  ],),
                ),
                3.ySpace,
                //preparation method ---------------------------------------------------
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.greyBorder),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      AppColor.shadow
                    ],
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        showSvgIconWidget(iconPath: AppIcons.ingredientesIcon),
                        5.width,
                        KText(text:  AppStrings.preparationMethod,fontSize: 16,fontWeight: FontWeight.w600),
                      ],
                    ),
                    2.ySpace,
                    ListView.builder(
                      itemCount: c.ingredients.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: c.ingredients[index].preparationList!
                              .map((prep) => KText( text:
                                '${index+1}. ${prep.preparationDetails}',
                                    fontSize: 16,
                              ))
                              .toList(),
                        );
                      },
                    )
                  ],),
                ),
            ],),
          ),
        );
      }
    );
  }
}
