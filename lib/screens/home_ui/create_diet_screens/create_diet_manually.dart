import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/create_diet_screens/diet_added.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class CreateDietManually extends StatelessWidget {
  const CreateDietManually({super.key});

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
        height: mQ.height * 0.1,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: kTextButton(
          onPressed: () {
            Get.to(()=> DietAdded());
          },
          btnText: 'Confirmar e criar',
          gradient: AppColor.greenGradient,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Descrição do alimento',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            30.height,
            CustomTextField(context: context,
              hintText: 'Bolo de cenoura com chocolate',
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
              textInputType: TextInputType.text,
            ),
            10.height,
            CustomTextField(context: context,
              prefixText: 'Porção:',
              suffixText: 'gramas',
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
            ),
            10.height,
            CustomTextField(context: context,
              prefixText: 'Calorias por porção:',
              suffixText: 'kcal',
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
            ),
            30.height,
            Text('Macronutrientes',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            10.height,
            CustomTextField(context: context,
              prefixText: 'Carboidratos:',
              suffixText: 'gramas',
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
            ),
            10.height,
            CustomTextField(context: context,
              prefixText: 'Proteínas:',
              suffixText: 'gramas',
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
            ),
            10.height,
            CustomTextField(context: context,
              prefixText: 'Gorduras:',
              suffixText: 'gramas',
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
              textInputAction: TextInputAction.done,
            ),

          ],),
      ),);
  }
}
