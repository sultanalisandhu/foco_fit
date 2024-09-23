import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_datebirth.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_height.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class SelectGender extends StatelessWidget {
  SelectGender({super.key});
  final selectedIndex=(-1).obs;
  final _title= ['Homem', 'Mulher','Prefiro não dizer'].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
          onTap: (){
            Navigator.pop(context);
          }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Qual é o seu gênero?',
            style: primaryTextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Para personalizar sua experiência, por favor nos diga o seu gênero:',
            style: primaryTextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          20.height,
          ListView.builder(
              itemCount: _title.length,
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
                    titleTextStyle: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: AppColor.blackColor),
                    title: Text(_title[index].toString()),
                  ),
                ),
                );
              }),
          Spacer(),
          kTextButton(
            onPressed: (){
              Get.to(()=> SelectDateBirth());
            },
            btnText: 'Continuar',
            useGradient: true,
          )
        ],).paddingSymmetric(horizontal: 12,vertical: 15)
    );
  }
}