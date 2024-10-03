import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';

class ProfileSettingData{
  String? title;
  String? subTitle;
  String? iconPath;
  ProfileSettingData({this.title,this.subTitle,this.iconPath});
}
List<ProfileSettingData> profileSettingAccessList= [
  ProfileSettingData(
    title: AppStrings.email,
    subTitle: AppStrings.loremIpsumEmail,
    iconPath: AppIcons.emailIcon,
  ),
  ProfileSettingData(
    title: AppStrings.password,
    subTitle: '**************',
    iconPath: AppIcons.keyBoardIcon,
  ),
  ProfileSettingData(
    title: AppStrings.cellPhone,
    subTitle: '(16) 99999-9999',
    iconPath: AppIcons.phoneIcon,
  ),
];
List<ProfileSettingData> profileSettingDataList= [
  ProfileSettingData(
    title: AppStrings.dateOfBirth,
    subTitle: '01/12/1998',
    iconPath: AppIcons.cakeIcon,
  ),
  ProfileSettingData(
    title: AppStrings.gender,
    subTitle: AppStrings.man,
    iconPath: AppIcons.genderIcon,
  ),
  ProfileSettingData(
    title: AppStrings.height,
    subTitle: '60 cm',
    iconPath: AppIcons.heightIcon,
  ),
  ProfileSettingData(
    title: AppStrings.currentWeight,
    subTitle: '67 kg',
    iconPath: AppIcons.weightIcon,
  ),
  ProfileSettingData(
    title: AppStrings.goalWeight,
    subTitle: '60 kg',
    iconPath: AppIcons.goalWeightIcon,
  ),
  ProfileSettingData(
    title: AppStrings.activityLevel,
    subTitle: AppStrings.sedentary,
    iconPath: AppIcons.shoeIcon,
  ),
  ProfileSettingData(
    title: AppStrings.myDiet,
    subTitle: AppStrings.vegetarian,
    iconPath: AppIcons.saladIcon,
  ),
  ProfileSettingData(
    title: AppStrings.calorieGoal,
    subTitle: AppStrings.calorieGoalDescription,
    iconPath: AppIcons.chartIcon,
  ),
  ProfileSettingData(
    title: AppStrings.macronutrientGoal,
    subTitle: AppStrings.macronutrientGoalDescription,
    iconPath: AppIcons.chartIcon,
  ),
  ProfileSettingData(
    title: AppStrings.medicalConditions,
    subTitle: AppStrings.hypertensionDiabetes,
    iconPath: AppIcons.medicalIcon,
  ),
];
List<ProfileSettingData> profileSettingOnList= [
  ProfileSettingData(
    title: AppStrings.mySignature,
    iconPath: AppIcons.badgeIcon,
  ),
  ProfileSettingData(
    title: AppStrings.privacyPolicies,
    iconPath: AppIcons.shieldIcon,
  ),
  ProfileSettingData(
    title: AppStrings.termsOfService,
    iconPath: AppIcons.termsIcon,
  ),
  ProfileSettingData(
    title: AppStrings.sourceOfRecommendations,
    iconPath: AppIcons.bookIcon,
  ),
  ProfileSettingData(
    title: AppStrings.sendEmailToSupport,
    iconPath: AppIcons.envelopeIcon,
  ),
];