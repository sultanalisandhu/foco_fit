import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/create_diet_screens/generating_diet.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/generating_recipe.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/recipe_added.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class CreateDietAi extends StatelessWidget {
  CreateDietAi({super.key});
  final HomeController controller = Get.find<HomeController>(tag: 'homeController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: 'Criar alimento',
        onTap: () {
          Get.back();
        },
      ),
      bottomNavigationBar: Container(
        height: mQ.height * 0.15,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.info, color: AppColor.greyColor),
                15.width,
                Expanded(
                  child: Text(
                    'Todas as informações nutricionais são baseadas na descrição dos ingredientes preenchidos no campo acima.',
                    style: primaryTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.greyColor,
                    ),
                  ),
                ),
              ],
            ),
            5.height,
      kTextButton(
                onPressed: () {
                    Get.to(() => GeneratingDiet());
                },
                btnText: 'Analisar',
                gradient: AppColor.greenGradient,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome do alimento',
              style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            10.height,
            CustomTextField(
              context: context,
              controller: controller.foodNameController,
              hintText: 'Bolo de cenoura com chocolate',
              color: AppColor.whiteColor,
              borderColor:  AppColor.greyColor,
              textInputType: TextInputType.text,
            ),
            20.height,
            Text(
              'Ingredientes',
              style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            10.height,
          CustomTextField(
              context: context,
              controller: controller.ingredientsController,
              hintText:
              'Exemplo: 2 ovos, 500g de farinha de trigo, 1 xícara de óleo de soja, 1 pitada de sal, 3 copos de leite integral',
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
              maxLines: 6,
            textInputType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}


