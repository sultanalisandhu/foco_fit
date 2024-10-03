import 'package:flutter/material.dart';
import 'package:focofit/models/k_models/recipe_data.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  ///Wheel Scroll Controller
  final FixedExtentScrollController dateController = FixedExtentScrollController();
  final FixedExtentScrollController monthController = FixedExtentScrollController();
  final FixedExtentScrollController yearController = FixedExtentScrollController();
  final FixedExtentScrollController cmController = FixedExtentScrollController();
  final FixedExtentScrollController ftController = FixedExtentScrollController();
  final FixedExtentScrollController inchController = FixedExtentScrollController();
  final FixedExtentScrollController kgController = FixedExtentScrollController();
  final FixedExtentScrollController grController = FixedExtentScrollController();




  ///Variables
  final RxInt selectedWeightKg = 0.obs;
  final RxInt selectedWeightGr = 0.obs;
  final RxInt currentDate = 1.obs;
  final RxInt currentMonth = 1.obs;
  final RxInt selectedGenderIndex = (-1).obs;
  final RxInt mySelectedDiet = (-1).obs;
  final RxInt heightInFt = 0.obs;
  final RxInt heightInch = 0.obs;
  final RxInt heightInCm = 0.obs;
  final RxInt currentYear = 1990.obs;
  final RxString selectedHeight = 'cm'.obs;
  final RxBool recalculateCalorieLimit= true.obs;
  final int currentYearValue = DateTime.now().year;
  final RxString selectedDateRange = ''.obs;


  ///CustomLists
  final RxList<String> genderList= [AppStrings.masculine,AppStrings.feminine,AppStrings.iPreferNotToSay].obs;
  final RxList<ActivityLevelList> activityLevelList= [
    ActivityLevelList(
      title: AppStrings.low,
      subTitle: AppStrings.officeRemoteWork
    ),
    ActivityLevelList(
        title: AppStrings.moderate,
        subTitle: AppStrings.standingWork
    ),
    ActivityLevelList(
        title: AppStrings.high,
        subTitle: AppStrings.physicallyDemandingWork
    ),
    ActivityLevelList(
        title: AppStrings.xima,
        subTitle: AppStrings.heavyPhysicalWork
    )
  ].obs;
}