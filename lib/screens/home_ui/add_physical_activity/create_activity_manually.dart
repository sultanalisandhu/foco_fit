import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/activity_edited.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class CreateActivityManually extends StatelessWidget {
  CreateActivityManually({super.key});
  final HomeController controller = Get.find<HomeController>(tag: 'homeController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: () {
          Get.back();
        },
        title: AppStrings.createPhysicalActivity,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.namePhysicalActivity,
              style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            10.height,
            CustomTextField(
              context: context,
              hintText: '${AppStrings.example}: ${AppStrings.walking}',
              textInputType: TextInputType.text,
            ),
            Text(
              AppStrings.totalDuration,
              style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            10.height,
            CustomTextField(
              context: context,
              prefixText: AppStrings.duration,
              suffixText: ' ${AppStrings.min}',
              textDirection: TextDirection.ltr,
              textInputType: TextInputType.number,
            ),
            Text(
              AppStrings.caloriesBurned,
              style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            10.height,
            CustomTextField(
              context: context,
              prefixText: AppStrings.calories,
              suffixText: ' ${AppStrings.kcal}',
              textDirection: TextDirection.ltr,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: kTextButton(
          onPressed: () {
            Get.to(() => const ActivityEdited());
          },
          btnText: AppStrings.confirmAndCreate,
          useGradient: true
        ),
      ),
    );
  }
}


