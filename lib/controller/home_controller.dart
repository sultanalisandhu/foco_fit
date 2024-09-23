import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final currentDate = DateTime.now().obs;
  final selectedDay = Rx<int?>(DateTime.now().day); // Set initial day to today's date
  final daysInMonth = <int>[].obs;

  String get monthAndYear => DateFormat('MMMM yyyy').format(currentDate.value);

  void _initializeDaysInMonth() {
    // Initialize days in the current month
    final days = List.generate(
      DateTime(currentDate.value.year, currentDate.value.month + 1, 0).day,
          (index) => index + 1,
    );
    daysInMonth.value = days;

    // Set selectedDay to today if in the current month
    if (currentDate.value.month == DateTime.now().month &&
        currentDate.value.year == DateTime.now().year) {
      selectedDay.value = DateTime.now().day;
    } else {
      selectedDay.value = null; // Clear selection if not the current month
    }
  }

  void previousMonth() {
    currentDate.value = DateTime(currentDate.value.year, currentDate.value.month - 1, 1);
    _initializeDaysInMonth();
  }

  void nextMonth() {
    currentDate.value = DateTime(currentDate.value.year, currentDate.value.month + 1, 1);
    _initializeDaysInMonth();
  }

  void selectDay(int day) {
    selectedDay.value = day;
  }

  @override
  void onInit() {
    super.onInit();
    _initializeDaysInMonth();
  }
}
