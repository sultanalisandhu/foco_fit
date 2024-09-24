import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/create_activity_ai.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/create_activity_manually.dart';
import 'package:focofit/screens/home_ui/create_diet_screens/create_diet_ai.dart';
import 'package:focofit/screens/home_ui/create_diet_screens/create_diet_manually.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class CreateActivityOptions extends StatelessWidget {
  const CreateActivityOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
          onTap: (){
            Navigator.pop(context);
          },
          title: 'Criar atividade física'
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage(AppImages.yellowStartImg),height: 250,width: 250,),
              Text('Você pode cadastrar uma nova receita manualmente ou utilizaro FocoAI, a nossa inteligência artificial, para criar automaticamente para você.',
                style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              )
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kTextButton(
                  onPressed: (){
                    Get.to(()=> CreateActivityAi());
                  },
                  btnText: 'Usar o FocoFit Pro+',
                  useGradient: true
              ),
              10.height,
              KOutlineButton(
                  onTap: (){
                    Get.to(()=>  CreateActivityManually());
                  },
                  btnText: 'Criar manualmente',
                  textGradient: AppColor.blackGradient,
                  gradient: AppColor.blackGradient)
            ],
          ).paddingSymmetric(horizontal: 15,vertical: 10),
        ],
      ),
    );
  }
}
