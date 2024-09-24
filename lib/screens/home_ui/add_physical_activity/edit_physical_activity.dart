import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/activity_edited.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class EditPhysicalActivity extends StatelessWidget {
  const EditPhysicalActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: ()=> Get.back(),
        title: 'Criar atividade física',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nome da atividade física',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          10.height,
          CustomTextField(context: context,
          hintText: 'Natacao',
            textInputType: TextInputType.text,
          ),
          20.height,
          Text('Calorias quiemadas por hora',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          10.height,
          CustomTextField(context: context,
            prefixText: 'Calorias: ',
            suffixText: ' Kcal',
            textDirection: TextDirection.ltr,
            textInputAction: TextInputAction.done,
          )
        ],
      ).paddingSymmetric(horizontal: 15,vertical: 10),

      bottomNavigationBar: kTextButton(
        onPressed: (){
          Get.to(()=> ActivityEdited());
        },
        btnText: 'Confirmir e salvar',
      ).paddingSymmetric(horizontal: 15,vertical: 10),
    );
  }
}
