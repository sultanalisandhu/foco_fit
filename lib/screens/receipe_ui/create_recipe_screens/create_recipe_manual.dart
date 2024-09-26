import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/recipe_added.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/recipe_widgets/k_create_recipe_sheet.dart';
import 'package:get/get.dart';

class CreateRecipeManual extends StatelessWidget {
  CreateRecipeManual({super.key});
  final RecipeController controller= Get.find(tag: 'recipeController');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: 'Criar receita',
        onTap: (){
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.info,color: AppColor.greyColor,),
                15.width,
                Expanded(child: Text('Todas as informações nutricionais são baseadas na descrição dos ingredientes preenchidos no campo acima.',style:
                primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400)
                  ,))
              ],
            ),
            5.height,
            kTextButton(
              onPressed: (){
                Get.to(()=>RecipeAdded());
              },
              btnText: 'Salvar receita',
              gradient: AppColor.blackGradient,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome da receita',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            10.height,
            CustomTextField(
              context: context,
              controller: controller.recipeNameC,
              hintText: 'Bolo de chocolate sem açúcar',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
            ),
            20.height,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ingrediente',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    Text('Quantidade',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        context: context,
                        controller: controller.recipeIngredientC,
                        hintText: 'Bolo de chocolate sem açúcar',
                        textInputType: TextInputType.text,
                      ),
                    ),
                    5.width,
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        context: context,
                      controller: controller.recipeIngredientQuantityC,
                      suffixText: 'g',
                        textDirection: TextDirection.ltr,
                      )
                    ),

                  ],
                ),
              20.height,
              KOutlineButton(
                  onTap: (){},
                  btnText: 'Adicionar ingrediente',
                  gradient: AppColor.blackGradient,
                textGradient: AppColor.blackGradient,
              ),
              ],
            ),
            20.height,
            Text('Modo de preparo',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            10.height,
            CustomTextField(
              context: context,
              controller: controller.recipeDescriptionC,
              hintText: 'Bolo de chocolate sem açúcar',
              maxLines: 6,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,

            ),

          ],
        ),
      ),
    );
  }
}
