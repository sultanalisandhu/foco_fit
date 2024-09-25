import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProfileController extends GetxController{
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

  final RxList<String> genderList= ['Masculino','Feminino','Prefiro não dizer'].obs;
  final RxList<ActivityLevelList> activityLevelList= [
    ActivityLevelList(
      title: 'Baixa',
      subTitle: 'Escritório, trabalho remoto ou sedentário'
    ),
    ActivityLevelList(
        title: 'Moderada',
        subTitle: 'Trabalho em pé (ex: garçom, entregador)'
    ),
    ActivityLevelList(
        title: 'Alta',
        subTitle: 'Trabalho de exigência física (ex: pedreiro)'
    ),
    ActivityLevelList(
        title: 'xima',
        subTitle: 'Trabalho físico pesado (ex: academia)'
    )
  ].obs;








}
class ActivityLevelList{
  String? title;
  String? subTitle;
  ActivityLevelList({this.title,this.subTitle});
}