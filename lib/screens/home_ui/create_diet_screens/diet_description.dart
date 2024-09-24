import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class DietDescription extends StatelessWidget {
  const DietDescription({super.key});

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
                print('ertyui');
                Get.back();
                Get.back();
                Get.back();
                Get.back();
              },
              btnText: 'Confirmar e criar',
              gradient: AppColor.greenGradient,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Descrição do alimento',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          Text('Torta de limão recheada com baunilha',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
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
