import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_gender.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class SelectName extends StatelessWidget {
  const SelectName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Como você se chama?',style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
          30.height,
          Text('Primeiro nome',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
          5.height,
          GetTextField(
            obSecureText: false,
            context: context,
          hintText: 'Digite sua nova senha',),
            25.height,
            Text('Sobrenome',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
            5.height,
            GetTextField(
              obSecureText: false,
              context: context,
              hintText: 'Digite sua nova senha',),
            const Spacer(),
            kTextButton(
              onPressed: (){
                Get.to(()=>SelectGender());
              },
              btnText: 'Continuar',
              useGradient: true
            )
        ],),
      ),
    );
  }
}
