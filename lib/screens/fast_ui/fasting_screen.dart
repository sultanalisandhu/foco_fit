import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/fasting_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/fast_ui/fasting_bottom_sheets.dart';
import 'package:focofit/screens/fast_ui/see_fasting.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class FastingScreen extends StatelessWidget {
  FastingScreen({super.key});
  final FastingController c= Get.put(FastingController(),tag: 'fastingController');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: 'Jejum Intermitente'
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context,i){
              return Obx(()=> GestureDetector(
                  onTap: (){
                    c.selectedFasting.value= i;
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: c.selectedFasting.value==i?AppColor.startGradient : AppColor.greyBorder),
                      boxShadow: const [
                        AppColor.shadow
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('12 - 12',style: primaryTextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                        Container(
                          width: 2,
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppColor.greyColor,
                            borderRadius: BorderRadius.circular(12),
                          ),

                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: const BoxDecoration(gradient: AppColor.primaryGradient,shape: BoxShape.circle),
                                ),
                                5.width,
                                Text('12 horas em jejum',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: const BoxDecoration(gradient: AppColor.primaryGradient,shape: BoxShape.circle),
                                ),
                                5.width,
                                Text('12 horas comendo',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                              ],
                            ),
                          ],)
                      ],
                    ),

                  ),
                ),
              );
            }),
          ),
          Obx(() => kTextButton(
            btnText: 'Confirmar seleção',
            onPressed:
            c.selectedFasting.value != -1
                ? () {
              KFastBottomSheet.selectTimeSheet(context,
                  onConfirmTap: (){
                Get.to(()=> SeeFasting());
              });
            }
                : null,
            color:
            c.selectedFasting.value != -1 ? null : AppColor.greyColor,
            useGradient:
            c.selectedFasting.value != -1,
          ))
        ],
      ).paddingSymmetric(horizontal: 25,vertical: 15),
    );
  }
}
