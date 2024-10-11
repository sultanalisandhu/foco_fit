import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/lets_start.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_height.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectMedicalConditions extends StatelessWidget {
  SelectMedicalConditions({super.key});
 final RxInt selectedIndex=(-1).obs;
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
          KText(text: AppStrings.haveAnyMedicalConditions,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
          ),
          20.height,
          Expanded(
            child: ListView.separated(
                itemCount: 5,
              separatorBuilder: (BuildContext context, int index) { return 15.height; },
                itemBuilder: (context,index){
              return Obx(()=>ListTile(
                onTap: ()=>selectedIndex.value=index,
                contentPadding: const  EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side:  BorderSide(
                    color: selectedIndex.value==index? AppColor.startGradient:AppColor.greyColor,width: selectedIndex.value==index?2:1)),
                title: KText(text: AppStrings.hypertension),
              ),
              );
            },),
          ),
        ],).paddingSymmetric(horizontal: 15,vertical: 10),

      bottomNavigationBar: kTextButton(
          onPressed: (){
            Get.to(()=> LetsStart());
          },
          btnText: AppStrings.continuue,
          useGradient: true
      ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
    );
  }
}