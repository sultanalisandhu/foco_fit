import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/fast_ui/fasting_bottom_sheets.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SeeFasting extends StatelessWidget {
  const SeeFasting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: 'Jejum Intermitente'
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.lightGreyBorder),
                boxShadow: const [
                  AppColor.shadow
                ]
              ),
              child: Column(children: [
                CircularPercentIndicator(
                  animationDuration: 1000,
                  linearGradient: AppColor.primaryGradient,
                  backgroundColor: AppColor.lightGreyColor,
                  animation: true,
                  restartAnimation: true,
                  rotateLinearGradient: true,
                  fillColor: Colors.transparent,
                  circularStrokeCap: CircularStrokeCap.round,
                  widgetIndicator: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.circle,color: Colors.white,size: 12,)),
                  radius: 100,
                  lineWidth: 20,
                  backgroundWidth: 22,
                  percent: 0.4,
                  curve: Curves.easeIn,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Tempo decorrido', style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                      Text('00:00:25', style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                      15.height,
                      Text('Tempo decorrido', style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                      Text('00:00:25', style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                40.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    children: [
                      Text('Inicio às',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      GradientText(text: '22 : 00', gradient: AppColor.primaryGradient,style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      Text('Hoje (17/08)',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 2,
                    color: AppColor.greyColor,
                  ),
                  Column(
                    children: [
                      Text('Inicio às',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      GradientText(text: '22 : 00', gradient: AppColor.primaryGradient,style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      Text('Hoje (17/08)',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ],)
              ],),
            ),
            20.height,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.lightGreyBorder),
                  boxShadow: const [
                    AppColor.shadow
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Plano de jejum atual: 12 - 12',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  kTextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    useGradient: true,
                    width: 100,
                    borderRadius: 15,
                    btnText: 'Alter',
                  )
                ],),
            ),
            50.height,
            kTextButton(
                onPressed: (){
                  KFastBottomSheet.breakFastSheet(context,
                  onConfirmTap: (){},
                    onCancelTap: (){}
                  );
                },
                useGradient: true,
                btnText: 'Iniciar jejum')
          ],
        ),
      ),
    );
  }
}
