import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/create_recipe_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class SearchRecipeManually extends StatelessWidget {
  SearchRecipeManually({super.key});
  final TextEditingController textEditingController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<HomeController>(tag: 'homeController'),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            title: 'Café da manhã',
            onTap: () {
              Get.back();
            },
            trailingOnTap: () {
              Get.to(() => CreateRecipeScreen());
            },
            trailingIcon: AppIcons.plusIcon,
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            height: mQ.height*0.1,
            width: mQ.width,
            child: kNumberButton(
                onPressed: () {},
              itemCount: '0',
              btnText: 'Confirmar e salvar',
            ),
          ),
          body: DefaultTabController(
            length: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  /// search container
                  BorderlessTextFiled(
                    context: context,
                    prefixText: AppIcons.settingIcon,
                    hintText: 'O que você quer preparar?',
                  ),
                  10.height,
                  CustomTextField(
                    context: context,
                  controller: textEditingController,
                    prefixText: 'Quantidade:',
                     suffixText: 'gramas',
                  ),
                  10.height,
                  Container(
                    padding: const EdgeInsets.all(2),
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
                      children: [
                        ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context,index){
                          return ListTile(
                            title: Text('Arroz doce com canela em pó'),
                            titleTextStyle: primaryTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            subtitle: Text('319 calorias (100g)'),
                            subtitleTextStyle: primaryTextStyle(
                              fontSize: 14,
                              color: AppColor.greyColor,
                            ),

                            trailing: GestureDetector(
                              onTap: (){},
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColor.startGradient)
                                ),
                                child: const Icon(Icons.add,color: AppColor.endGradient,)
                              ),
                            ),
                          );
                        }),
                        Container(
                          color: Colors.blue,
                          child: const Center(child: Text('Favoritos')),
                        ),
                        Container(
                          color: Colors.blue,
                          child: const Center(child: Text('Criadas')),
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
}
