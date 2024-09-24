import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/search_recipe_manually.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_data/home_data.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/recipe_widgets/k_circular_progress_bar.dart';
import 'package:get/get.dart';

class KHomeBottomSheet {
  // Common method to show the bottom sheet
  static void show({
    required BuildContext context,
    required String title,
    required List<Widget> content,
    Function()? onConfirmTap,
    double heightFactor = 0.4,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: AppColor.whiteColor,
      builder: (BuildContext context) {
        return SizedBox(
          height: context.isKeyboardVisible ? mQ.height : mQ.height * heightFactor,
          width: mQ.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.isKeyboardVisible ? 30.height : 2.height,
                _buildHeader(),
                20.height,
                _buildTitle(title),
                const Divider(color: AppColor.greyColor),
                10.height,
                ...content,
                const Spacer(),
                onConfirmTap!=null?
                _buildConfirmButton(onConfirmTap):const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }



  static void quickRegistration(BuildContext context, {required Function() onExerciseTap, required Function() onSnackTap}) {
    show(
      context: context,
      title: 'Registro rápido',
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onExerciseTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyBorder),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Image.asset(AppImages.dumbellImg,height: 50,width: 50,),
                    Text('Exercício',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: onSnackTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyBorder),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Image.asset(AppImages.choclateImg,height: 50,width: 50,),
                    Text('Refeição',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            ),
          ],
        )
      ],
      heightFactor: 0.35,
    );
  }

  static void snackRegisterSheet(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: 'Registro rápido de refeição',
      content: [
        Text('Nome do alimento',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        BorderlessTextFiled(context: context,hintText: 'Bolo de cenoura com chocolate',),
        10.height,
        Text('Calorias',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        BorderlessTextFiled(context: context,hintText: 'Calorias:',suffixText: 'kcal',prefixText: 'Caloriadds:',),
        10.height,
        Text('Carboidratos (opcional)',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        BorderlessTextFiled(context: context,hintText: 'Carboidratos',suffixText: 'gramas',prefixText: 'Carboidratos:'),
        10.height,
        Text('Proteínas (opcional)',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        BorderlessTextFiled(context: context,hintText: 'Proteínas:',suffixText: 'gramas',prefixText: 'Proteínas:'),
        10.height,
        Text('Gorduras (opcional)',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        BorderlessTextFiled(context: context,hintText: 'Gorduras',suffixText: 'gramas',prefixText: 'Gorduras:'),
      ],
      onConfirmTap: onConfirmTap!,
      heightFactor: 0.65,
    );
  }

  static void exerciseRegisterSheet(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: 'Registro rápido de exercício',
      content: [
        Text('Nome da atividade',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        BorderlessTextFiled(context: context,hintText: 'Ex: corrida',),
        10.height,
        Text('Calorias',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        BorderlessTextFiled(context: context,hintText: 'Calorias:',suffixText: 'kcal',prefixText: 'Caloriadds:',),
        10.height,
        Text('Duração',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        BorderlessTextFiled(context: context,hintText: 'Duração:',suffixText: 'min',prefixText: 'Caloriadds:')
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.55,
    );
  }

  static void confirmationSheet(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: 'Registro rápido de refeição',
      content: [
        Image(image: AssetImage(AppImages.greenCheckImg)),
        Align(
          alignment: Alignment.center,
          child: Text('Exercicio registrado com successo!',
            style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
        ),
      ],
      onConfirmTap: onConfirmTap!,
      heightFactor: 0.65,
    );
  }

  static void recordMeal(BuildContext context) {
    show(
      context: context,
      title: 'Registrar refeição',
      content: [
        SizedBox(
          height: mQ.height*0.15,
          child: ListView.builder(
            itemCount: registerRecipeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Obx(() => GestureDetector(
                onTap: () {
                  if(index==0){
                    Get.back();
                    Get.to((()=> SearchRecipeManually()));
                  }else if(index==1){

                  }else{

                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.greyColor,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(registerRecipeList[index].iconPath.toString()),
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        registerRecipeList[index].title.toString(),
                        textAlign: TextAlign.center,
                        style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ));
            },
          ),
        ),
      ],
      heightFactor: 0.35,
    );
  }

  static void addCalories(BuildContext context) {
    show(
      context: context,
      title: 'Registrar café da manhã',
      content: [
        Align(
            alignment: Alignment.center,
            child: Text('Arroz doce cozido com canela em pó',style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
        10.height,
        Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(
              children: [
            TextSpan(text: '0', style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            TextSpan(text: 'Kcal', style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600)),
          ])),
        ),
        15.height,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          KCircularProgressBar(consumed: '0', dietName: 'Carboidrato', lineGradient: AppColor.greenGradient, progressValue: 0.2),
          KCircularProgressBar(consumed: '0', dietName: 'Proteína', lineGradient: AppColor.redGradient, progressValue: 0.2),
          KCircularProgressBar(consumed: '0', dietName: 'Gordura', lineGradient: AppColor.primaryGradient, progressValue: 0.2),
        ],),
        15.height,
        CustomTextField(
          context: context,
          controller: TextEditingController(),
          prefixText: 'Quantidade:',
          suffixText: 'gramas',
          color: AppColor.whiteColor,borderColor: AppColor.lightGreyColor,
          textDirection: TextDirection.ltr,
          textInputAction: TextInputAction.done,
        ),
      ],
      onConfirmTap: (){},
      heightFactor: 0.55,
    );
  }

  static void addPhysicalActivity(BuildContext context) {
    show(
      context: context,
      title: 'Registrar atividade física',
      content: [
        Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(text: '0 ', style: primaryTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    TextSpan(text: 'Kcal', style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600)),
                  ])),
        ),
        15.height,
        CustomTextField(
          context: context,
          controller: TextEditingController(),
          prefixText: 'Duração:',
          suffixText: 'min.',
          textDirection: TextDirection.ltr,
          textInputAction: TextInputAction.done,
        ),
      ],
      onConfirmTap: (){},
      heightFactor: 0.4,
    );
  }



  static Widget _buildHeader() {
    return Align(
      alignment: Alignment.center,
      child: showSvgIconWidget(iconPath: AppIcons.dashIcon),
    );
  }

  static Widget _buildTitle(String title) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: primaryTextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }



  static Widget _buildConfirmButton(Function()? onConfirmTap) {
    return kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap!,
      btnText: 'Salvar',
      useGradient: true,
    );
  }
}
