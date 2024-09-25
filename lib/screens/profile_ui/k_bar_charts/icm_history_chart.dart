// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:focofit/controller/charts_controller.dart';
// import 'package:focofit/utils/app_colors.dart';
// import 'package:focofit/utils/k_text_styles.dart';
// import 'package:get/get.dart';
//
// class IcmHistoryChart extends StatelessWidget {
//   IcmHistoryChart({super.key});
//
//   final ChartsController controller = Get.put(ChartsController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _buildWeightInfo('Inicial', controller.initialWeight),
//               _buildWeightInfo('Atual', controller.currentWeight),
//               _buildWeightInfo('Meta', controller.goalWeight),
//             ],
//           ),
//           const SizedBox(height: 20),
//           _buildPeriodButtons(),
//           const SizedBox(height: 20),
//           _buildBarChart(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildWeightInfo(String label, RxDouble value) {
//     return Column(
//       children: [
//         Text(label, style: primaryTextStyle(fontSize: 16)),
//         Obx(() => Text(
//           value.value.toStringAsFixed(1), // Display 1 decimal
//           style: primaryTextStyle(
//               fontSize: 20, fontWeight: FontWeight.bold),
//         )),
//       ],
//     );
//   }
//
//   Widget _buildPeriodButtons() {
//     return Obx(
//           () => Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: AppColor.greyBorder),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildPeriodButton('Semana', controller.selectedPeriod.value == 'Semana','calories'),
//             _buildPeriodButton('Mês', controller.selectedPeriod.value == 'Mês','calories'),
//             _buildPeriodButton('Ano', controller.selectedPeriod.value == 'Ano','calories'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPeriodButton(String period, bool isSelected,String chartType) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () => controller.updatePeriod(period,chartType),
//         child: Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//           decoration: BoxDecoration(
//             gradient: isSelected ? AppColor.primaryGradient : null,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Text(
//             period,
//             style: primaryTextStyle(
//                 color: isSelected ? Colors.white : Colors.orange,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBarChart() {
//     return SizedBox(
//       height: 300,
//       child: Obx(
//             () => BarChart(
//           BarChartData(
//             alignment: BarChartAlignment.spaceAround,
//             barGroups: _buildBarGroups(),
//             titlesData: FlTitlesData(
//               show: true,
//               bottomTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   getTitlesWidget: _buildBottomTitles,
//                 ),
//               ),
//               leftTitles: const AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//               rightTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   reservedSize: 48,
//                   interval: _getIntervalForSelectedPeriod(),
//                   getTitlesWidget: (value, meta) {
//                     return Text(
//                       '${value.toInt()} kg',
//                       style: primaryTextStyle(fontSize: 10),
//                     );
//                   },
//                 ),
//               ),
//               topTitles: const AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//             ),
//             borderData: FlBorderData(show: false),
//             gridData: const FlGridData(show: false),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<BarChartGroupData> _buildBarGroups() {
//     return controller.chartData
//         .asMap()
//         .entries
//         .map((entry) => BarChartGroupData(
//       x: entry.key,
//       barRods: [
//         BarChartRodData(
//           toY: entry.value,
//           width: 8,
//           borderRadius: BorderRadius.circular(4),
//           gradient: AppColor.primaryGradient,
//         ),
//       ],
//     ))
//         .toList();
//   }
//
//   double _getIntervalForSelectedPeriod() {
//     switch (controller.selectedPeriod.value) {
//       case 'Semana':
//         return 1;
//       case 'Mês':
//         return 2;
//       case 'Ano':
//         return 5;
//       default:
//         return 1;
//     }
//   }
//
//   Widget _buildBottomTitles(double value, TitleMeta meta) {
//     const weeklyLabels = ['31 dom', '1 seg', '2 ter', '3 qua', '4 qui', '5 sex', '6 sáb'];
//     const monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr'];
//     const annualLabels = ['2019', '2020', '2021', '2022', '2023'];
//
//     String text = '';
//
//     if (controller.selectedPeriod.value == 'Semana') {
//       text = weeklyLabels[value.toInt()];
//     } else if (controller.selectedPeriod.value == 'Mês') {
//       text = monthlyLabels[value.toInt()];
//     } else if (controller.selectedPeriod.value == 'Ano') {
//       text = annualLabels[value.toInt()];
//     }
//
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 4.0,
//       child: Text(
//         text,
//         style: primaryTextStyle(fontSize: 12),
//       ),
//     );
//   }
// }
