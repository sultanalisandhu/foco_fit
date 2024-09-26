import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/calorie_goal_screen.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/macro_nutrients.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/medical_conditions.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/privacy_policy.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/terms_service.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/utils/app_data/profile_setting_data.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../profile_bottom_sheets/access_data_sheet.dart';
import '../profile_bottom_sheets/personal_data_sheets.dart';
import 'my_diet.dart';
class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(ProfileController()),
      builder: (c) {
        return Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: kAppBar(
            onTap: (){Navigator.pop(context);},
            title: 'Configurações'
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(
                width: 160,
                height: 160,
                child: Stack(children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                            NetworkImage('https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?t=st=1726037514~exp=1726041114~hmac='
                                'df5d8c90eb262717d2a532974732ce0c847b84a167232fe9b051e093d9d3bc61&w=1380'))
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: showSvgIconWidget(iconPath: AppIcons.editIcon,height: 20),
                  )
                ],),
              ),
                15.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Weslei Vicentini',style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                    10.width,
                    showSvgIconWidget(iconPath: AppIcons.editIcon,height: 20,onTap: (){}),
                  ],
                ),
                15.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Peso perdido',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    10.width,
                    showSvgIconWidget(iconPath: AppIcons.editIcon,height: 20,onTap: (){}),
                  ],
                ),
                15.height,
                const StepProgressIndicator(
                  totalSteps: 10,
                  currentStep: 4,
                  selectedColor: AppColor.startGradient,
                  unselectedColor: AppColor.lightGreyColor,
                  roundedEdges: Radius.circular(35),
                  size: 8,
                  padding: 1,
                ),
                10.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('3,250  kg',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                    Text('de',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                    Text('12,400  kg',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                  ],
                ),
                30.height,
                /// Access Container
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Dados de acesso',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                15.height,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.greyColor,width: 0.5)
                  ),
                  child: ListView.builder(
                      itemCount: profileSettingAccessList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return ListTile(
                          leading: showSvgIconWidget(iconPath: profileSettingAccessList[index].iconPath.toString(),),
                          title: Text(profileSettingAccessList[index].title.toString()),
                          subtitle: Text(profileSettingAccessList[index].subTitle.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          trailing: showSvgIconWidget(iconPath: AppIcons.editIcon,
                              onTap: (){
                                switch (profileSettingAccessList[index].title)
                                {
                                  case 'Email':
                                    KBottomSheet.editEmail(context,onConfirmTap: (){Navigator.pop(context);});
                                  break;
                                  case 'Senha':
                                    KBottomSheet.editPassword(context,onConfirmTap: (){Navigator.pop(context);});
                                    break;
                                  case 'Celular':
                                    KBottomSheet.editPhone(context,onConfirmTap: (){Navigator.pop(context);});
                                    break;
                                }

                          }),
                          contentPadding: EdgeInsets.zero,
                          titleTextStyle: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                          subtitleTextStyle: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                          shape: index != profileSettingAccessList.length - 1
                              ? Border( bottom: BorderSide(color: AppColor.greyColor.withOpacity(0.4)),)
                              : null,
                        );
                      }),
                ),
                ///Personal Data Container
                20.height,
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Dados pessoais',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                15.height,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.greyColor,width: 0.5)
                  ),
                  child: ListView.builder(
                      itemCount: profileSettingDataList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                    return ListTile(
                      leading: showSvgIconWidget(iconPath: profileSettingDataList[index].iconPath.toString()),
                      title: Text(profileSettingDataList[index].title.toString()),
                      subtitle: Text(profileSettingDataList[index].subTitle.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      trailing: showSvgIconWidget(
                          onTap: (){
                            switch(profileSettingDataList[index].title){
                              case 'Data de nascimento':
                                KPersonalDataSheet.editDateBirth(context,
                                    onConfirmTap: (){ Get.back(); },
                                  profileController: c

                                );
                                break;
                              case 'Gênero':
                                KPersonalDataSheet.editGender(context,
                                onConfirmTap: (){Get.back();},
                                    profileController: c
                                );
                                break;
                              case 'Altura':
                                KPersonalDataSheet.editHeight(context,
                                    onConfirmTap: (){Get.back();},
                                    profileController: c
                                );
                                break;
                              case 'Peso atual':
                                KPersonalDataSheet.editCurrentWeight(context,
                                    onConfirmTap: (){Get.back();},
                                    profileController: c
                                );
                                break;
                              case 'Peso meta':
                                KPersonalDataSheet.editGoalWeight(context,
                                    onConfirmTap: (){Get.back();},
                                    profileController: c
                                );
                                break;
                              case 'Nível de atividade':
                                KPersonalDataSheet.editActivityLevel(context,
                                    onConfirmTap: (){Get.back();},
                                    profileController: c
                                );
                                break;
                              case 'Minha dieta':
                                Get.to(()=> MyDiet());
                                break;
                              case 'Meta de calorias':
                                Get.to(()=> CalorieGoalScreen());
                                break;
                              case 'Meta de macronutrientes':
                                Get.to(()=> MacroNeutrients());
                                break;
                            case 'Condições médicas':
                            Get.to(()=> MedicalConditions());
                            break;
                            }
                          },
                          height: 20,
                          iconPath: AppIcons.editIcon),
                      contentPadding: EdgeInsets.zero,
                      titleTextStyle: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                      subtitleTextStyle: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                      shape: index != profileSettingDataList.length - 1
                          ? Border(
                        bottom: BorderSide(color: AppColor.greyColor.withOpacity(0.4)),
                      )
                          : null,
                    );
                  },
                  ),
                ),
                20.height,
                /// On Container
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Sobre',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                15.height,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.greyColor,width: 0.5)
                  ),
                  child: ListView.builder(
                      itemCount: profileSettingOnList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return ListTile(
                          onTap: (){
                            switch(profileSettingOnList[index].title){
                              case 'Minha assinatura':
                                Get.to(()=> PrivacyPolicy());
                                break;
                              case 'Políticas de privacidade':
                                Get.to(()=> PrivacyPolicy());
                                break;
                              case 'Termos de serviço':
                                Get.to(()=> TermsAndService());
                                break;

                            }

                          },
                          leading: showSvgIconWidget(iconPath: profileSettingOnList[index].iconPath.toString()),
                          title: Text(profileSettingOnList[index].title.toString()),
                          trailing: const Icon(Icons.arrow_forward_ios,color: AppColor.greyColor,),
                          contentPadding: EdgeInsets.zero,
                          titleTextStyle: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                          shape: index != profileSettingOnList.length - 1
                              ? Border(
                            bottom: BorderSide(color: AppColor.greyColor.withOpacity(0.4)),
                          )
                              : null,
                        );
                      }),
                ),
                20.height,
                kTextButton(
                  onPressed: (){},
                  btnText: 'Sair da conta',
                  useGradient: true
                )
                ],),
          ),);
      }
    );
  }

}
