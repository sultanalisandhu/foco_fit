import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/create_recipe_option.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/edit_recipe_screen.dart';
import 'package:focofit/widgets/k_bottom_sheets/recipe_bottom_sheet.dart';
import 'package:focofit/screens/receipe_ui/recipe_detail_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecipeController>(
      init: Get.put(RecipeController()),
      tag: 'recipeController',
      builder: (c) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: kAppBar(
              title: AppStrings.recipes,
              trailingOnTap: () {
                Get.to(() => const CreateRecipeOption());
              },
              trailingIcon: AppIcons.plusIcon,
              shadowColor: AppColor.blackColor.withOpacity(0.5)
            ),
            body: Column(
              children: [
                2.ySpace,
                /// Search Container
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        context: context,
                      prefixIcon: AppIcons.searchIcon,
                        textInputType: TextInputType.text,
                        hintText: AppStrings.whatYouWantToPrepare,
                        fieldBorderRadius: 32,
                      ),
                    ),
                    2.xSpace,
                    GestureDetector(
                      onTap: (){
                        KRecipeBottomSheets.filter(
                            onConfirmTap: (){
                              print('object');
                              Navigator.pop(context);
                            },
                            recipeController: c,
                            context,
                        );
                      },
                      child: Container(
                        height: 8.h,width: 20.w,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.lightGreyColor
                        ),
                        child: showSvgIconWidget(iconPath: AppIcons.barIcon,onTap: (){
                          KRecipeBottomSheets.filter(
                            onConfirmTap: (){},
                            recipeController: c,
                            context,
                          )
                          ;}),
                      ),
                    )
                  ],
                ),
                2.ySpace,
                /// TabBar Container
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: AppColor.greyBorder),
                  ),
                  child: TabBar(
                    unselectedLabelColor: AppColor.greyColor,
                    splashBorderRadius: BorderRadius.circular(24),
                    labelStyle: kTextStyle(
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    unselectedLabelStyle: kTextStyle(
                      color: AppColor.blackColor,
                      fontSize: 15,
                    ),
                    indicator: BoxDecoration(
                      gradient: AppColor.primaryGradient,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(text: AppStrings.all),
                      Tab(text: AppStrings.favorites),
                      Tab(text: AppStrings.created),
                    ],
                  ),
                ),
                1.ySpace,
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// Tab 1: GridView for 'all'
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          mainAxisExtent: 30.h,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => RecipeDetailScreen());
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 21.h,
                                  padding: const EdgeInsets.only(bottom: 5,left: 5,right: 5),
                                  decoration: BoxDecoration(
                                    color: AppColor.blackColor,
                                    borderRadius: BorderRadius.circular(12),
                                    image: const DecorationImage(
                                      image: NetworkImage('https://www.nutricia.ie/patients-carers/recipes/porridge/_jcr_content/_cq_featuredimage.coreimg.jpeg/1697714492069/neocate-syneo-porridge-recipe-image.jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(26),
                                              color: AppColor.whiteColor,
                                            ),
                                            child: KText(text:  '10 ${AppStrings.min}',fontSize: 13,),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(26),
                                              color: AppColor.whiteColor,
                                            ),
                                            child: KText(text:'319 ${AppStrings.kcal}',fontSize: 13,),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                               1.ySpace,
                                 KText(
                                   text: AppStrings.smokedSalmon,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                   fontSize: 15,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      /// Tab 2: GridView for 'Favourites'
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          mainAxisExtent: 30.h,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => RecipeDetailScreen());
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 21.h,
                                  padding: const EdgeInsets.only(bottom: 5,left: 5,right: 5),
                                  decoration: BoxDecoration(
                                    color: AppColor.blackColor,
                                    borderRadius: BorderRadius.circular(12),
                                    image: const DecorationImage(
                                      image: AssetImage(AppImages.recipeImg),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(26),
                                              color: AppColor.whiteColor,
                                            ),
                                            child: KText(text:  '10 ${AppStrings.min}',fontSize: 13,),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(26),
                                              color: AppColor.whiteColor,
                                            ),
                                            child: KText(text:'319 ${AppStrings.kcal}',fontSize: 13,),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                1.ySpace,
                                KText(
                                  text: AppStrings.smokedSalmon,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  fontSize: 15,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      /// Tab 3: Placeholder for 'created'
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          mainAxisExtent: 30.h,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => EditRecipeScreen());
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 21.h,
                                  padding: const EdgeInsets.only(bottom: 5,left: 5,right: 5),
                                  decoration: BoxDecoration(
                                    color: AppColor.blackColor,
                                    borderRadius: BorderRadius.circular(12),
                                    image: const DecorationImage(
                                      image: NetworkImage('https://www.nutricia.ie/patients-carers/recipes/porridge/_jcr_content/_cq_featuredimage.coreimg.jpeg/1697714492069/neocate-syneo-porridge-recipe-image.jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(26),
                                              color: AppColor.whiteColor,
                                            ),
                                            child: KText(text:  '10 ${AppStrings.min}',fontSize: 13,),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(26),
                                              color: AppColor.whiteColor,
                                            ),
                                            child: KText(text:'319 ${AppStrings.kcal}',fontSize: 13,),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                1.ySpace,
                                KText(
                                  text: AppStrings.smokedSalmon,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  fontSize: 15,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 4.w,vertical:  1.h),
          ),
        );
      },
    );
  }
}
