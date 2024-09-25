import 'dart:math';

import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_subscribe_container.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/all_physical_activity.dart';
import 'package:focofit/screens/home_ui/subscribed_screen.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_bottom_sheets/home_bottom_sheets.dart';
import 'package:focofit/screens/profile_ui/notification_screen.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/profile_setting.dart';
import 'package:focofit/utils/app_data/home_data.dart';
import 'package:focofit/widgets/home_widgets/expansion_tile.dart';
import 'package:focofit/widgets/home_widgets/k_calories_container.dart';
import 'package:get/get.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:intl/intl.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController(),tag: 'homeController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar:
      kProfileAppBar(
          onTileTap: ()=>Get.to(()=> ProfileSetting()),
          trailingOnTap: (){
            Get.to(()=> NotificationScreen());
          },
          imgPath: 'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?t=st=1726037514~exp=1726041114~hmac='
              'df5d8c90eb262717d2a532974732ce0c847b84a167232fe9b051e093d9d3bc61&w=1380',
          title: 'Boa tarde,',
          subTitle: 'Weslei Vicentini',
          notificationCount: '9'
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SubScribedContainer(
            onTap: ()=>Get.to(()=> SubscribedScreen(),),
                title: 'Seja um assinante FocoFit Pro',
                subTitle: 'Aproveite nossos recursos exclusivos!'
            ),
            20.height,
            SizedBox(
              height: 100,
              child: Obx(() {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.daysInMonth.length,
                  itemBuilder: (context, index) {
                    final day = controller.daysInMonth[index];
                    final dayOfWeek = DateFormat('E').format(DateTime(
                      controller.currentDate.value.year,
                      controller.currentDate.value.month,
                      day,
                    ));

                    // Check if this is the selected day
                    final isSelected = day == controller.selectedDay.value;

                    return GestureDetector(
                      onTap: () {
                        controller.selectDay(day);
                      },
                      child: Column(
                        children: [
                          Text(
                            dayOfWeek,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: isSelected
                                  ? AppColor.primaryGradient  // Selected day gradient
                                  : AppColor.greenGradient,   // Default gradient
                            ),
                            child: Center(
                              child: Text(
                                day.toString(),
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            15.height,
            const CaloriesContainer(
              title: 'Meta de calorias',
              totalCalories: '1252',
              consumed: '1252',
              burned: '1252',
              progress: 0.4,
              carbohydrate: '400 / 1000',
              carbPercent: 0.6,
              protein: '400 / 1000',
              proteinPercent: 0.7,
              fat: '200 / 1000',
              fatPercent: 0.4,
            ),
            20.height,
            kTextButton(
                onPressed: (){
                  KHomeBottomSheet.quickRegistration(
                      context,
                      onExerciseTap: (){
                        KHomeBottomSheet.exerciseRegisterSheet(
                            context,
                            onConfirmTap: (){
                              print('object');
                              KHomeBottomSheet.confirmationSheet(context,onConfirmTap: (){
                                Navigator.pop(context);
                              });
                            });
                      },
                    onSnackTap: (){
                        KHomeBottomSheet.snackRegisterSheet(context,
                        onConfirmTap: (){
                          KHomeBottomSheet.confirmationSheet(context,onConfirmTap: (){

                          });
                        }
                        );
                    }
                  );
                },
                btnText: 'Registro rápido de calorias',
              useGradient: true
            ),
            20.height,
            ListView.builder(
              itemCount: homeDataList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index >= homeDataList.length - 2) {
                  return KHomeListTile(
                    title: homeDataList[index].title,
                    subtitle: 'Meta: dynamic value',
                    imageUrl: homeDataList[index].iconPath,
                    borderColor: AppColor.redColor,
                  );
                } else {
                  // Render your CustomExpandableContainer for other items
                  final randomColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
                  return CustomExpandableContainer(
                    title: homeDataList[index].title,
                    subtitle: 'Meta diária: 100/1000 kcal',
                    imageUrl: homeDataList[index].iconPath,
                    borderColor: randomColor,
                    childrenData: const [
                      {'name': 'Cafe sem acucar,100ml ', 'calories': ' 56 kcal'},
                      {'name': 'Cafe com leite, 200ml ', 'calories': ' 120 kcal'},
                      {'name': 'Pão integral, 50g ', 'calories': ' 150 kcal'},
                    ],
                    onTapTrailing: () {
                      switch (homeDataList[index].title) {
                        case 'Café da manhã':
                          KHomeBottomSheet.recordMeal(context);
                          break;
                        case 'Almoço':
                          KHomeBottomSheet.recordMeal(context);
                          break;
                        case 'Jantar':
                          KHomeBottomSheet.recordMeal(context);
                          break;
                        case 'Lanches':
                          KHomeBottomSheet.recordMeal(context);
                          break;
                        case 'Atividades físicas':
                          Get.to(() => AllPhysicalActivity());
                          break;
                      }
                    },
                    onEditPressed: () {
                      print('Editor historico tapped');
                    },
                  );
                }
              },
            )

          ],
        ),
      ),
    );
  }
}
