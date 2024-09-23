import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/lets_start.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_height.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class SelectActivityLevel extends StatelessWidget {
  SelectActivityLevel({super.key});
 final RxInt selectedIndex=(-1).obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
          onTap: (){
            Navigator.pop(context);
          }
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qual é o seu nível de atividade?',
              style: primaryTextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            20.height,
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
              return Obx(()=>Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: ()=>selectedIndex.value=index,
                    contentPadding: const  EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side:  BorderSide(
                        color: selectedIndex.value==index? AppColor.startGradient:AppColor.greyColor,width: selectedIndex.value==index?2:1)),
                    titleTextStyle: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: AppColor.blackColor),
                    subtitleTextStyle: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.blackColor),
                    title: const Text('Iniciante'),
                    subtitle: const Text('Atividade física limitada, passo a maior parte do meu tempo sentado(a) ou deitado(a).'),
                  ),
                ),
              );
            }),
            50.height,
            kTextButton(
              onPressed: (){
                Get.to(()=> LetsStart());
              },
              btnText: 'Continuar',
              useGradient: true,
            )
          ],),
      ),
    );
  }
}