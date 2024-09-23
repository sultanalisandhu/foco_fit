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
        child: kTextButton(
          onPressed: (){
            Get.to(()=>RecipeAdded());
          },
          btnText: 'Salvar receita',
          gradient: AppColor.blackGradient,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome da receita',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            10.height,
            BorderlessTextFiled(
              context: context,
            controller: controller.recipeNameC,
            hintText: 'Bolo de chocolate sem açúcar',
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
                      child: BorderlessTextFiled(context: context,
                        controller: controller.recipeIngredientC,
                        hintText: 'Bolo de chocolate sem açúcar',
                      ),
                    ),
                    5.width,
                    Expanded(
                      flex: 2,
                      child: BorderlessTextFiled(
                        context: context,
                        controller: controller.recipeIngredientQuantityC,
                        hintText: 'Bolo',
                        contentPadding: 2,
                        keyboardType: TextInputType.number,
                        suffixWidget: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ///selected quantity type name
                           Text(controller.selectedQuantityType.value,style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
                            IconButton(onPressed: (){
                              KCreateRecipeSheetSheet.addQuantityType(context,c: controller,);
                            }, icon: const Icon(Icons.keyboard_arrow_down)),
                          ],
                        ),

                      ),
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
            BorderlessTextFiled(context: context,
              controller: controller.recipeDescriptionC,
              hintText: 'Descreva aqui como você faz para preparar esta receita.',
              maxLines: 6,
            ),
            20.height,
            Row(
              children: [
               const Icon(Icons.info,color: AppColor.greyColor,),
                15.width,
                Expanded(child: Text('Todas as informações nutricionais são baseadas na descrição dos ingredientes preenchidos no campo acima.',style:
                  primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400)
                  ,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
