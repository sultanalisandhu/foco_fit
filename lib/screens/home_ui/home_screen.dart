import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
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
      appBar: kProfileAppBar(
        onTap: ()=>Get.to(()=> ProfileSetting()),
        trailingOnTap: (){
          Get.to(()=> NotificationScreen());
        }
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Month and Year with Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous Month Button
                IconButton(
                  onPressed: controller.previousMonth,
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                // Display Month and Year
                Obx(() {
                  return Text(
                    controller.monthAndYear,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  );
                }),
                // Next Month Button
                IconButton(
                  onPressed: controller.nextMonth,
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            // Weekday Names and Dates
            SizedBox(
              height: 100,
              child: Obx(() {
                // Wrap with Obx to observe daysInMonth and selectedDay changes
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
                              gradient: isSelected ? AppColor.primaryGradient : null,
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
            15.height,
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
            ListView.builder(
                itemCount: homeDataList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
              return CustomExpandableContainer(
                title: homeDataList[index].title,
                subtitle: 'Meta diária: 100/1000 kcal',
                imageUrl: homeDataList[index].iconPath,
                childrenData: const [
                  {'name': 'Cafe sem acucar,100ml', 'calories': '56 kcal'},
                  {'name': 'Cafe com leite, 200ml', 'calories': '120 kcal'},
                  {'name': 'Pão integral, 50g', 'calories': '150 kcal'},
                ],
                onTapTrailing: () {
                  KHomeBottomSheet.recordMeal(context);
                },
                onSavePressed: () {
                  print('Salvar refeicao tapped');
                },
                onEditPressed: () {
                  print('Editor historico tapped');
                },
              );
            })


          ],
        ),
      ),
    );
  }
}
