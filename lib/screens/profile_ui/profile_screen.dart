import 'package:flutter/material.dart';
import 'package:focofit/components/k_subscribe_container.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/subscribed_screen.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/activity_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/aqua_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/fasting_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/feeding_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/icm_history_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/calories_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/neutrients_charts.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/profile_setting.dart';
import 'package:focofit/screens/profile_ui/weight_history_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(ChartsController()),
      builder: (c) {
        return Scaffold(
          appBar: kProfileAppBar(
            onTileTap: () {},
            trailingOnTap: () {
              Get.to(()=> ProfileSetting());
            },
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
              KText(text:  'Historico de paiso',fontSize: 18),
                3.ySpace,
                CaloriesGraphScreen(
                  controller: c,
                  onButtonTap: (){
                    Get.to(()=> WeightHistoryScreen());
                  },
                  btnText: 'Editor Historico',
                ),
                10.height,
                KText(text:  'Histórico de ICM',fontSize: 18),
                IcmHistoryChart(
                  controller: c,
                  onButtonTap: (){},
                  btnText: 'Editor Historico',),
                10.height,
                KText(text:  'Histórico de água',fontSize: 18),
                AquaChart(
                  controller: c,
                  onButtonTap: (){
                    Get.to(()=> WeightHistoryScreen());
                  },
                  btnText: 'Editor Historico',
                ),
                10.height,
                KText(text:  'Histórico de atividades',fontSize: 18),
                ActivityChart(
                  controller: c,
                  onButtonTap: (){
                    Get.to(()=> WeightHistoryScreen());
                  },
                  btnText: 'Editor Historico',
                ),
                10.height,
                KText(text:  'Histórico de alimentação',fontSize: 18),
                10.height,
                FeedingChart(
                  controller: c,
                  onButtonTap: (){
                    Get.to(()=> WeightHistoryScreen());
                  },
                  btnText: 'Editor Historico',
                ),
                10.height,
                KText(text:  'Histórico de macronutrientes',fontSize: 18),
                10.height,
                NutrientsCharts(
                  controller: c,
                ),
                10.height,
                KText(text:  'Histórico de jejum',fontSize: 18),
                10.height,
                FastingChart(
                  controller: c,
                  onButtonTap: (){
                    Get.to(()=> WeightHistoryScreen());
                  },
                  btnText: 'Editor Historico',
                ),
            ],).paddingSymmetric(horizontal: 15,vertical: 15),
          ),
        );
      }
    );
  }
}