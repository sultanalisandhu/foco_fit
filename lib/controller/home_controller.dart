import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  /// TextEditingControllers
  final TextEditingController searchController = TextEditingController();
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();

  /// Variables
  final currentDate = DateTime.now().obs;
  final selectedDay = Rx<int?>(DateTime.now().day);
  final daysInMonth = <int>[].obs;

  /// Methods
  @override
  void onInit() {
    super.onInit();
    calculateDaysInMonth(DateTime.now());
  }

  void calculateDaysInMonth(DateTime date) {
    final daysInMonthCount = DateTime(date.year, date.month + 1, 0).day;
    daysInMonth.value = List.generate(daysInMonthCount, (index) => index + 1);
  }
  void selectDay(int day) {
    selectedDay.value = day;
  }
}
