import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/create_recipe_screen.dart';
import 'package:focofit/screens/receipe_ui/recipe_detail_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  // Create TabController outside of the widget
  TabController _createTabController(BuildContext context) {
    return TabController(length: 3, vsync: Scaffold.of(context));
  }

  @override
  Widget build(BuildContext context) {
    final TabController _tabController = _createTabController(context);

    return GetBuilder(
      init: Get.put(RecipeController(),tag: 'recipeController'),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            title: 'Receitas',
            trailingOnTap: () {
              Get.to(()=> CreateRecipeScreen());
            },
            trailingIcon: AppIcons.plusIcon,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                /// search container
                BorderlessTextFiled(context: context,
                prefixText: AppIcons.settingIcon,
                  hintText: 'O que você quer preparar?',
                ),
                10.height,
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: AppColor.greyBorder)
                  ),
                  child: TabBar(
                    unselectedLabelColor: AppColor.greyColor,
                  splashBorderRadius: BorderRadius.circular(24),
                    labelStyle: primaryTextStyle(
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                    unselectedLabelStyle: primaryTextStyle(color: AppColor.blackColor,fontSize: 17),
                    indicator: BoxDecoration(gradient: AppColor.primaryGradient,borderRadius: BorderRadius.circular(24)),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Todas'),
                      Tab(text: 'Favoritas'),
                      Tab(text: 'Criadas'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [

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
                            onTap: (){
                              Get.to(()=> RecipeDetailScreen());
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(26),
                                          color: AppColor.whiteColor,
                                        ),
                                        child: const Text('10 min'),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(26),
                                          color: AppColor.whiteColor,
                                        ),
                                        child: const Text('319 kcal'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Salmão defumado com molho de limão ao molho de castanha',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
                            onTap: (){
                              Get.to(()=> RecipeDetailScreen());
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(26),
                                          color: AppColor.whiteColor,
                                        ),
                                        child: const Text('10 min'),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(26),
                                          color: AppColor.whiteColor,
                                        ),
                                        child: const Text('319 kcal'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Salmão defumado com molho de limão ao molho de castanha',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Container(color: Colors.blue, child: const Center(child: Text('Criadas'))),
                    ],
                  ),
                ),


              ],
            ),
          ),
        );
      },
    );
  }
}