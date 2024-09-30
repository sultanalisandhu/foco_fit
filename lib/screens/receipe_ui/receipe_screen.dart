import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/create_recipe_option.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/edit_recipe_screen.dart';
import 'package:focofit/screens/receipe_ui/recipe_bottom_sheet.dart';
import 'package:focofit/screens/receipe_ui/recipe_detail_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecipeController>(
      init: Get.put(RecipeController()),
      tag: 'recipeController',
      builder: (c) {
        return DefaultTabController(
          length: 3, // Number of tabs
          child: Scaffold(
            appBar: kAppBar(
              title: AppStrings.recipes,
              trailingOnTap: () {
                Get.to(() => CreateRecipeOption());
              },
              trailingIcon: AppIcons.plusIcon,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  /// Search Container
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          context: context,
                        prefixIcon: AppIcons.searchIcon,
                          textInputType: TextInputType.text,
                          hintText: AppStrings.whatYouWantToPrepare,
                        ),
                      ),
                      5.width,
                      GestureDetector(
                        onTap: (){
                          KRecipeFilterSheet.filter(context, onConfirmTap: (){});
                        },
                        child: Container(
                          height: 60,width: 60,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.lightGreyColor
                          ),
                          child: showSvgIconWidget(iconPath: AppIcons.barIcon,onTap: (){KRecipeFilterSheet.filter(context, onConfirmTap: (){});}),
                        ),
                      )
                    ],
                  ),
                  10.height,
                  /// TabBar Container
                  Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(color: AppColor.greyBorder),
                    ),
                    child: TabBar(
                      unselectedLabelColor: AppColor.greyColor,
                      splashBorderRadius: BorderRadius.circular(24),

                      labelStyle: primaryTextStyle(
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                      unselectedLabelStyle: primaryTextStyle(
                        color: AppColor.blackColor,
                        fontSize: 17,
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
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// Tab 1: GridView for 'Todas'
                        GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: 13,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => RecipeDetailScreen());
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    padding: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: AssetImage(AppImages.recipeImg),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 80,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            color: AppColor.whiteColor,
                                          ),
                                          child: Text('10 ${AppStrings.min}'),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            color: AppColor.whiteColor,
                                          ),
                                          child: Text('319 ${AppStrings.kcal}'),
                                        ),
                                      ],
                                    ),
                                  ),
                                 5.height,
                                   Text(
                                    AppStrings.smokedSalmon,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        /// Tab 2: GridView for 'Favoritas'
                        GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2,
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
                                    height: 150,
                                    padding: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: AssetImage(AppImages.recipeImg),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 80,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            color: AppColor.whiteColor,
                                          ),
                                          child: Text('10 ${AppStrings.min}'),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            color: AppColor.whiteColor,
                                          ),
                                          child: Text('319 ${AppStrings.kcal}'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    AppStrings.smokedSalmon,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        /// Tab 3: Placeholder for 'Criadas'
                        GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => EditRecipeScreen());
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    padding: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: AssetImage(AppImages.recipeImg),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 80,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            color: AppColor.whiteColor,
                                          ),
                                          child: Text('10 ${AppStrings.min}'),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            color: AppColor.whiteColor,
                                          ),
                                          child: Text('319 ${AppStrings.kcal}'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    AppStrings.smokedSalmon,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
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
              ),
            ),
          ),
        );
      },
    );
  }

  // A method for building the GridView (since it's used twice)

}
