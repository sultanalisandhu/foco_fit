import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class CalorieGoalScreen extends StatelessWidget {
  CalorieGoalScreen({super.key});
  final ProfileController c = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: 'Meta de calorias',
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: kTextButton(
          onPressed: () {},
          btnText: 'Salvar',
          useGradient: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            CustomSwitchTile(
              value: c.recalculateCalorieLimit,
              onChanged: (v) {
                c.recalculateCalorieLimit.value = v;
              },
              title: 'Recalcular limite automaticamente',
            ),
            15.height,
            Obx(() {
              final bool isActive = !c.recalculateCalorieLimit.value;
              return Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: isActive ? AppColor.greyBorder : AppColor.greyColor.withOpacity(0.4)),
                  color: isActive ? Colors.white : AppColor.lightGreyColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cafe De manha',
                      style: primaryTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.black : Colors.grey,
                      ),
                    ),
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: isActive
                                        ? AppColor.greyBorder
                                        : AppColor.greyColor.withOpacity(0.4)),
                              ),
                              child: Text(
                                '33',
                                style: primaryTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isActive ? Colors.black : Colors.grey,
                                ),
                              ),
                            ),
                            5.width,
                            Text(
                              '%',
                              style: primaryTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isActive ? Colors.black : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: isActive
                                        ? AppColor.greyBorder
                                        : AppColor.greyColor.withOpacity(0.4)),
                              ),
                              child: Text(
                                '1500',
                                style: primaryTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isActive ? Colors.black : Colors.grey,
                                ),
                              ),
                            ),
                            5.width,
                            Text(
                              'kcal',
                              style: primaryTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isActive ? Colors.black : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
