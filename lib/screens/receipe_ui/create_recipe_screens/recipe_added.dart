import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/edit_recipe_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class RecipeAdded extends StatelessWidget {
  const RecipeAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: (){
          Get.back();
        },
        title: AppStrings.createRecipe,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: kTextButton(
          onPressed: (){
            Get.to(()=> EditRecipeScreen());
          },
          btnText: AppStrings.viewRecipe,
          gradient: AppColor.blackGradient,
        ),
      ),
      body:
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
          const Image(image: AssetImage(AppImages.greenCheckImg),height: 250,width: 250,),
          Text(AppStrings.recipeAddedConsultAnyTime,
            textAlign: TextAlign.center,
            style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
        ],).paddingSymmetric(horizontal: 25,vertical: 10)

    ],),);
  }
}
