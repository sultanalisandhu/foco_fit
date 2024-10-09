import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/calorie_goal_screen.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/change_app_language.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/macro_nutrients.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/medical_conditions.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/privacy_policy.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/terms_service.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/models/k_models/profile_setting_data.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/k_bottom_sheets/profile_bottom_sheets/access_data_sheet.dart';
import 'package:focofit/widgets/k_bottom_sheets/profile_bottom_sheets/personal_data_sheets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
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
            title: AppStrings.setting
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(
                width: 160,
                height: 150,
                child: Stack(children: [
                  Container(
                    height: 140,
                    width: 150,
                    decoration: const BoxDecoration(
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
                5.ySpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KText(text: 'Weslei Vicentini', fontSize: 20,fontWeight: FontWeight.w500),
                    2.xSpace,
                    showSvgIconWidget(iconPath: AppIcons.editIcon,height: 20,onTap: (){}),
                  ],
                ),
                KText(text: '25 ${AppStrings.years}', fontSize: 16,fontWeight: FontWeight.w500),
                2.ySpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KText(text: AppStrings.weightLoss, fontSize: 16,fontWeight: FontWeight.w500),
                    2.xSpace,
                    showSvgIconWidget(iconPath: AppIcons.editIcon,height: 20,onTap: (){}),
                  ],
                ),
                2.ySpace,
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
                    KText(text:  '3,250  kg',fontWeight: FontWeight.w500),
                    KText(text:  AppStrings.of,fontWeight: FontWeight.w500),
                    KText(text:  '12,400  kg',fontWeight: FontWeight.w500),
                  ],
                ),
                5.ySpace,
                /// Access Container
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: KText(text:  AppStrings.accessData,fontSize: 16,fontWeight: FontWeight.w600),
                    )),
                1.ySpace,
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
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
                            if(index==0){
                              KBottomSheet.editEmail(context,onConfirmTap: (){Navigator.pop(context);});
                            }else if(index==1){
                              KBottomSheet.editPassword(context,onConfirmTap: (){Navigator.pop(context);});
                            }else{
                              KBottomSheet.editPhone(context,onConfirmTap: (){Navigator.pop(context);});
                            }
                          }),
                          contentPadding: EdgeInsets.zero,
                          titleTextStyle: kTextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                          subtitleTextStyle: kTextStyle(),
                          shape: index != profileSettingAccessList.length - 1
                              ? Border( bottom: BorderSide(color: AppColor.greyColor.withOpacity(0.4)),)
                              : null,
                        );
                      }),
                ),
                ///Personal Data Container
                2.ySpace,
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: KText(text:  AppStrings.personalData,fontSize: 16,fontWeight: FontWeight.w600),
                    )),
                1.ySpace,
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
                            switch(index){
                              case 0:
                                KPersonalDataSheet.editDateBirth(context,
                                    onConfirmTap: (){ Get.back(); },
                                  profileController: c

                                );
                                break;
                              case 1:
                                KPersonalDataSheet.editGender(context,
                                onConfirmTap: (){Get.back();},
                                    profileController: c
                                );
                                break;
                              case 2:
                                KPersonalDataSheet.editHeight(context,
                                    onConfirmTap: (){Get.back();},
                                    profileController: c
                                );
                                break;
                              case 3:
                                KPersonalDataSheet.editCurrentWeight(context,
                                    onConfirmTap: (){Get.back();},
                                    profileController: c
                                );
                                break;
                              case 4:
                                KPersonalDataSheet.editGoalWeight(context,
                                    onConfirmTap: (){Get.back();},
                                    profileController: c
                                );
                                break;
                              case 5:
                                KPersonalDataSheet.editActivityLevel(context,
                                    onConfirmTap: (){Get.back();},
                                    profileController: c
                                );
                                break;
                              case 6:
                                Get.to(()=> MyDiet());
                                break;
                              case 7:
                                Get.to(()=> CalorieGoalScreen());
                                break;
                              case 8:
                                Get.to(()=> MacroNutrients());
                                break;
                            case 9:
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
                2.ySpace,
                /// On Container
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: KText(text:  AppStrings.on,fontSize: 16,fontWeight: FontWeight.w600),
                    )),
                1.ySpace,
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
                            switch(index){
                              case 0:
                                Get.to(()=> PrivacyPolicy());
                                break;
                              case 1:
                                Get.to(()=> ChangeAppLanguage());
                                break;
                              case 3:
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
                2.ySpace,
                kTextButton(
                  onPressed: (){
                    Get.back();
                  },
                  btnText: AppStrings.logOutOfAccount,
                  useGradient: true
                )
                ],),
          ),);
      }
    );
  }

}
