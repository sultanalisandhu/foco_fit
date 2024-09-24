import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/create_activity_options.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/edit_physical_activity.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/k_bottom_sheets/home_bottom_sheets.dart';
import 'package:get/get.dart';

class AllPhysicalActivity extends StatelessWidget {
  const AllPhysicalActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<HomeController>(tag: 'homeController'),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            title: 'Atividade física',
            onTap: () {
              Get.back();
            },
            trailingOnTap: () {
              Get.to(() => CreateActivityOptions());
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
              btnText: 'Adicionar atividade',
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
                    hintText: 'O que você fez hoje?',
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
                        /// All Physical Activity Tab Bar-----------------------------------
                    ListView.builder(
                      itemCount: 16,
                      itemBuilder: (context, index) {
                        return Slidable(
                          direction: Axis.horizontal,
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {},
                                backgroundColor: AppColor.greenColor,
                                foregroundColor: Colors.white,
                                icon: Icons.favorite,
                                label: 'Like',
                                autoClose: false,
                                borderRadius: BorderRadius.circular(16),

                              ),
                            ],
                          ),
                          child: ListTile(
                            title: const Text('Biscoito recheado de chocolate Trakinas'),
                            titleTextStyle: primaryTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            subtitle: const Text('Calorias: -319kcal'),
                            subtitleTextStyle: primaryTextStyle(
                              fontSize: 14,
                              color: AppColor.greyColor,
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                KHomeBottomSheet.addPhysicalActivity(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColor.startGradient),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: AppColor.endGradient,
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                        );
                      },
                    ),
                        /// favourites Physical Activity Tab Bar-----------------------------------
                      ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context,index){
                              return ListTile(
                                title: const Text('Minha nova atividade física favoritada numero 1'),
                                titleTextStyle: primaryTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                subtitle: const Text('Calorias: -319kcal'),
                                subtitleTextStyle: primaryTextStyle(
                                  fontSize: 14,
                                  color: AppColor.greyColor,
                                ),

                                trailing: GestureDetector(
                                  onTap: (){
                                    KHomeBottomSheet.addPhysicalActivity(context);
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
                        /// Created Physical Activity Tab Bar-----------------------------------
                        ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context,index){
                              return ListTile(
                                title: Row(
                                  children: [
                                    const Expanded(child: Text('Minha nova atividade física criada numero 1',maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                  showSvgIconWidget(
                                      onTap: (){
                                        Get.to(()=> EditPhysicalActivity());
                                      },
                                      iconPath: AppIcons.editIcon)
                                  ],
                                ),
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
                                    KHomeBottomSheet.addPhysicalActivity(context);
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
