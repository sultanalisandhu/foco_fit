import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_subscribe_container.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/subscribed_screen.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/icm_history_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/weight_history_chart.dart';
import 'package:focofit/screens/profile_ui/weight_history_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ChartsController chartsController= Get.put(ChartsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kProfileAppBar(
        onTileTap: () => Navigator.pop(context),
        trailingOnTap: () {},
        imgPath: 'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?t=st=1726037514~exp=1726041114~hmac='
            'df5d8c90eb262717d2a532974732ce0c847b84a167232fe9b051e093d9d3bc61&w=1380',
        title: 'Boa tarde,',
        subTitle: 'Weslei Vicentini',

      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SubScribedContainer(
              onTap: ()=>Get.to(()=> SubscribedScreen(),),
              title: 'Seja um assinante FocoFit Pro',
              subTitle: 'Aproveite nossos recursos exclusivos!',
            gradient: AppColor.primaryGradient,
          ),
          Text('Historico de paiso',style: primaryTextStyle(color: AppColor.blackColor,fontSize: 20),),
            10.height,
            CaloriesGraphScreen(
              controller: chartsController,
              onButtonTap: (){
                Get.to(()=> WeightHistoryScreen());
              },
              btnText: 'Editor Historico',
            ),
            20.height,
            Text('Histórico de ICM',style: primaryTextStyle(color: AppColor.blackColor,fontSize: 20),),
            10.height,
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            //   decoration: BoxDecoration(
            //     color: AppColor.whiteColor,
            //     borderRadius: BorderRadius.circular(16),
            //     boxShadow:const [
            //       AppColor.shadow
            //     ],
            //   ),
            //   child: Column(
            //     children: [
            //       IcmHistoryChart(),
            //       kTextButton(
            //         onPressed: (){},
            //         btnText: 'Editor Historico',
            //       useGradient: true
            //       ),
            //     ],
            //   ),
            // ),


        ],).paddingSymmetric(horizontal: 15,vertical: 15),
      ),
    );
  }
}