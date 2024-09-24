import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/create_diet_screens/create_diet_options.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/k_bottom_sheets/home_bottom_sheets.dart';
import 'package:get/get.dart';

class SearchRecipeManually extends StatelessWidget {
  const SearchRecipeManually({super.key});

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
              Get.to(() => CreateDietOptions());
            },
            trailingIcon: AppIcons.plusIcon,
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            height: mQ.height*0.08,
            width: mQ.width,
            child: kNumberButton(
                onPressed: () {
                },
              itemCount: '0',
              btnText: 'Confirmar e salvar',
            ),
          ),
          body: DefaultTabController(
            length: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  15.0,vertical: 10),
              child: Column(
                children: [
                  /// search container
                  CustomTextField(
                    context: context,
                    controller: c.searchController,
                    prefixIcon: AppIcons.searchIcon,
                    hintText: 'O que você comeu?',
                  ),
                  15.height,
                  Container(
                    height: mQ.height*0.05,
                    padding: const EdgeInsets.all(1),
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
                  10.height,
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context,index){
                          return ListTile(
                            title: const Text('Arroz doce com canela em pó'),
                            titleTextStyle: primaryTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            subtitle: const Text('319 calorias (100g)'),
                            subtitleTextStyle: primaryTextStyle(
                              fontSize: 14,
                              color: AppColor.greyColor,
                            ),

                            trailing: GestureDetector(
                              onTap: (){
                                KHomeBottomSheet.addCalories(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColor.startGradient)
                                ),
                                child: const Icon(Icons.add,color: AppColor.endGradient,)
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                          );
                        }),
                        ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context,index){
                              return ListTile(
                                title: const Text('Arroz doce com canela em pó'),
                                titleTextStyle: primaryTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                subtitle: const Text('319 calorias (100g)'),
                                subtitleTextStyle: primaryTextStyle(
                                  fontSize: 14,
                                  color: AppColor.greyColor,
                                ),

                                trailing: GestureDetector(
                                  onTap: (){
                                    KHomeBottomSheet.addCalories(context);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: AppColor.startGradient)
                                      ),
                                      child: const Icon(Icons.add,color: AppColor.endGradient,)
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                              );
                            }),
                        ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context,index){
                              return ListTile(
                                title: const Text('Arroz doce com canela em pó'),
                                titleTextStyle: primaryTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('319 calorias (100g)'),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10,),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(color: AppColor.startGradient),
                                        ),
                                        child: GradientText(text: 'Criado com FocoFit Pro+', gradient: AppColor.primaryGradient,style: primaryTextStyle(fontSize: 12),)),
                                  ],
                                ),
                                subtitleTextStyle: primaryTextStyle(
                                  fontSize: 14,
                                  color: AppColor.greyColor,
                                ),
                                trailing: GestureDetector(
                                  onTap: (){
                                    KHomeBottomSheet.addCalories(context);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: AppColor.startGradient)
                                      ),
                                      child: const Icon(Icons.add,color: AppColor.endGradient,)
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                              );
                            }),
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
