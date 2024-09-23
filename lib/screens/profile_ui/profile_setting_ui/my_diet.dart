import 'package:flutter/material.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

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
        title:'Minha dieta',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          children: [
            ListView.builder(
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
                          border: Border.all(color: profileController.mySelectedDiet.value== index?AppColor.startGradient:AppColor.greyBorder),
                          color: AppColor.whiteColor,
                          boxShadow: const [ AppColor.shadow ]
                        ),
                        child: ListTile(
                          title: const Text('Dieta Cetogenica'),
                          subtitle: const Column(
                            children: [
                              Divider(
                                color: AppColor.greyColor,
                                endIndent: 20,
                              ),
                              Text('Dieta Cetogenica Plano elimentar alto teor de gordura e baixo teor de '),
                            ],
                          ),
                          titleTextStyle: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                          subtitleTextStyle: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                              side:  const BorderSide(color: Colors.transparent,)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                        ),
                      ),
                    ),
                  );
                },)
          ],
        ),
      ),
    );
  }
}
