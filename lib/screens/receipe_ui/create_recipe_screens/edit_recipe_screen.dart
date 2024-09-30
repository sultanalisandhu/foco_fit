import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/create_recipe_manual.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/recipe_widgets/k_circular_progress_bar.dart';
import 'package:get/get.dart';

class EditRecipeScreen extends StatelessWidget {
  const EditRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecipeController>(
        init: Get.find<RecipeController>(tag: 'recipeController'),
        builder: (c) {
          return Scaffold(
            appBar: kAppBar(
                onTap: (){
                  Get.back();
                },
                title: AppStrings.recipes
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: mQ.width,
                    height: 250,
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
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColor.whiteColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Text('10 ${AppStrings.min}',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                            ),
                            5.width,
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColor.whiteColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Text('319 ${AppStrings.kcal}',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                            ),
                            const Spacer(),
                            GestureDetector(

                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration:  BoxDecoration(
                                  color: AppColor.whiteColor.withOpacity(0.8),
                                  shape: BoxShape.circle,
                                ),
                                child: showSvgIconWidget(iconPath: AppIcons.heartIcon,onTap: (){}),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  5.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text(AppStrings.sugarFreeAvocadoPudding,style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
                      showSvgIconWidget(iconPath: AppIcons.editIcon,onTap: (){
                        Get.to(()=> CreateRecipeManual());
                      },color: AppColor.blackColor),
                    ],
                  ),
                  20.height,
                  //MacroNutrients  ---------------------------------------------------
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
                          showSvgIconWidget(iconPath: AppIcons.chartIcon,color: AppColor.blackColor),
                          5.width,
                          Text(AppStrings.macronutrients,style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                        ],
                      ),
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KCircularProgressBar(
                            consumed: '190',
                            dietName: AppStrings.carbohydrate,
                            lineGradient: AppColor.greenGradient,
                            progressValue: 0.6,
                          ),
                          KCircularProgressBar(
                            consumed: '90',
                            dietName: AppStrings.protein,
                            lineGradient: AppColor.redGradient,
                            progressValue: 0.4,
                          ),
                          KCircularProgressBar(
                            consumed: '169',
                            dietName: AppStrings.fat,
                            lineGradient: AppColor.primaryGradient,
                            progressValue: 0.3,
                          ),
                        ],
                      ),
                    ],),
                  ),
                  20.height,
                  //Ingredients  ---------------------------------------------------
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
                          Text(AppStrings.ingredients,style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                        ],
                      ),
                      20.height,
                      ListView.builder(
                          itemCount: c.ingredients.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // ingredient name
                                  Text(c.ingredients[index].name.toString(),style: primaryTextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                                  const Expanded(child: Text('  ---------------------------------------------------------------------------------------   ',maxLines: 1,)),
                                  Text(c.ingredients[index].quantity.toString(),style: primaryTextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                                ],),
                            );
                          })
                    ],),
                  ),
                  20.height,
                  //preparation method ---------------------------------------------------
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
                          Text(AppStrings.preparationMethod,style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                        ],
                      ),
                      20.height,
                      ListView.builder(
                        itemCount: c.ingredients.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: c.ingredients[index].preparationList!
                                .map((prep) => Text(
                              '${index+1}. ${prep.preparationDetails}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
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
