import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/generating_recipe.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class CreateRecipeAi extends StatelessWidget {
  CreateRecipeAi({super.key});
  final RecipeController controller= Get.put(RecipeController(), tag: 'recipeController');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: AppStrings.chopTomatoes,
        onTap: (){
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.recipeName,style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            10.height,
            CustomTextField(
              context: context,
              controller: controller.recipeNameC,
              hintText: AppStrings.sugarFreeCake,
              color: Colors.white,
              textInputType: TextInputType.text,
              borderColor: AppColor.greyColor,
            ),
            20.height,
            Text(AppStrings.recipeDescriptionOptional,style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            10.height,
            CustomTextField(
              context: context,
              controller: controller.recipeDescriptionC,
              hintText: '${AppStrings.example}: ${AppStrings.recipeDemand}',
              maxLines: 6,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
              color: Colors.white,
              borderColor: AppColor.greyColor,
            ),
            20.height,

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: mQ.height*0.15,
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.info,color: AppColor.greyColor,),
                15.width,
                Expanded(child: Text(AppStrings.nutritionalInformationBasedOnIngredients,
                  style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                ))
              ],
            ),
            5.height,
            kTextButton(
              onPressed: (){
                Get.to(()=> GeneratingRecipe());
              },
              btnText: AppStrings.createRecipe,
              gradient: AppColor.blackGradient,
            ),
          ],
        ),
      ),
    );
  }
}
