import 'package:get/get.dart';


class ChartsController extends GetxController {
  var selectedPeriod = 'Semana'.obs; // Default period is 'Semana'
  var caloriesConsumed = 1000.obs;   // Default consumed calories
  var caloriesBurned = 2000.obs;     // Default burned calories
  var chartData = <double>[800, 700, 750, 700, 900, 850, 1000].obs;  // Weekly data

  /// Icm Chart Variables
  var selectedIcmPeriod = 'Semana'.obs;  // Default period is 'Semana'
  var initialWeight = 70.0.obs;       // Default initial weight
  var currentWeight = 72.0.obs;       // Default current weight
  var goalWeight = 68.0.obs;          // Default goal weight
  var icmChartData = <double>[70, 71, 72, 72, 73, 72, 71].obs;  // Weekly ICM data

  // Method to update the chart based on selected period
  void updatePeriod(String period) {
    selectedPeriod.value = period;

    if (period == 'Semana') {
      caloriesConsumed.value = 1000;
      caloriesBurned.value = 2000;
      chartData.value = [800, 700, 750, 700, 900, 850, 1000];  // Weekly data
    } else if (period == 'Mês') {
      caloriesConsumed.value = 4000;
      caloriesBurned.value = 5000;
      chartData.value = [3000, 3500, 4000, 5000];  // Monthly data example
    } else if (period == 'Ano') {
      caloriesConsumed.value = 10000;
      caloriesBurned.value = 15000;
      chartData.value = [10000, 12000, 13000, 15000];  // Annual data example
    }
  }

  ///ICm update period
  void updateIcmPeriod(String period) {
    selectedPeriod.value = period;

    if (period == 'Semana') {
      initialWeight.value = 70.0;
      currentWeight.value = 72.0;
      goalWeight.value = 68.0;
      chartData.value = [70, 71, 72, 72, 73, 72, 71];  // Weekly data
    } else if (period == 'Mês') {
      initialWeight.value = 69.0;
      currentWeight.value = 72.0;
      goalWeight.value = 68.0;
      chartData.value = [69, 70, 71, 72];  // Monthly data example
    } else if (period == 'Ano') {
      initialWeight.value = 68.0;
      currentWeight.value = 72.0;
      goalWeight.value = 65.0;
      chartData.value = [68, 70, 71, 72];  // Annual data example
    }
  }
}
