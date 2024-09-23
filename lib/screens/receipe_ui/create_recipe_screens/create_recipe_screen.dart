import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/create_recipe_ai.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/create_recipe_manual.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class CreateRecipeScreen extends StatelessWidget {
  const CreateRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title: 'Criar receita'
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
                    Get.to(()=> CreateRecipeAi());
                  },
                  btnText: 'Usar o FocoFit Pro+',
              useGradient: true
              ),
              10.height,
              KOutlineButton(
                  onTap: (){
                    Get.to(()=>CreateRecipeManual());
                  },
                  btnText: 'Criar manualmente',
                  gradient: AppColor.blackGradient)
            ],
          ).paddingSymmetric(horizontal: 15,vertical: 10),
        ],
      ),
    );
  }
}
