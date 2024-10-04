import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyDiet extends StatelessWidget {
  MyDiet({super.key});
  final ProfileController profileController= Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: kAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title:AppStrings.myDiet,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
        child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return Obx(()=>GestureDetector(
              onTap: (){
                profileController.mySelectedDiet.value= index;
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: profileController.mySelectedDiet.value== index?AppColor.startGradient:AppColor.lightGreyBorder),
                    color: AppColor.whiteColor,
                    boxShadow: const [ AppColor.shadow ]
                ),
                child: ListTile(
                  title: const KText(text:  'Dieta Cetogenica',fontSize: 16,fontWeight: FontWeight.w600),
                  subtitle: const Column(
                    children: [
                      Divider(
                        color: AppColor.lightGreyBorder,
                        endIndent: 20,
                      ),
                      const KText(text: 'Dieta Cetogenica Plano elimentar alto teor de gordura e baixo teor de '),
                    ],
                  ),
                  subtitleTextStyle: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                  shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                      side:  const BorderSide(color: Colors.transparent,)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                ),
              ),
            ),
            );
          },),
      ),

      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: kTextButton(
          onPressed: () { Get.back();},
          btnText: AppStrings.save,
          useGradient: true,
        ),
      ),
    );
  }
}
