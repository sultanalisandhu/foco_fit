import 'package:flutter/material.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/create_recipe_screen.dart';
import 'package:focofit/screens/receipe_ui/recipe_detail_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class SearchRecipeManually extends StatelessWidget {
  const SearchRecipeManually({super.key});

  TabController _createTabController(BuildContext context) {
    return TabController(length: 3, vsync: Scaffold.of(context));
  }

  @override
  Widget build(BuildContext context) {
    final TabController tabController = _createTabController(context);

    return GetBuilder<HomeController>(
      init: Get.find(tag: 'homeController'),
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
                    controller: tabController,
                    tabs: const [
                      Tab(text: 'Todos'),
                      Tab(text: 'Favoritos'),
                      Tab(text: 'Criados'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      Container(color: Colors.blue, child: const Center(child: Text('Todos'))),
                      Container(color: Colors.blue, child: const Center(child: Text('Favoritos'))),
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