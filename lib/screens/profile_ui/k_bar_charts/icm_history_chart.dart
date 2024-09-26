import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';


class IcmHistoryChart extends StatelessWidget {
  final ChartsController controller;
  final String btnText;
  final Function() onButtonTap;

  const IcmHistoryChart({
    super.key,
    required this.controller,
    required this.onButtonTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [AppColor.shadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCaloriesInfo('Inicial', controller.initialWeight),
              _buildCaloriesInfo('Atual', controller.currentWeight),
              _buildCaloriesInfo('Meta', controller.goalWeight),
            ],
          ),
          const SizedBox(height: 20),
          _buildPeriodButtons(),
          const SizedBox(height: 20),
          _buildBarChart(),
          kTextButton(btnText: btnText, onPressed: onButtonTap, useGradient: true),
        ],
      ),
    );
  }

  Widget _buildCaloriesInfo(String label, RxDouble value) {
    return Column(
      children: [
        Text(label, style: primaryTextStyle(fontSize: 16)),
        Obx(() => Text(
          '${value.value} kg',
          style: primaryTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildPeriodButtons() {
    return Obx(() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.greyBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPeriodButton('Semana', controller.selectedIcmPeriod.value == 'Semana'),
          _buildPeriodButton('Mês', controller.selectedIcmPeriod.value == 'Mês'),
          _buildPeriodButton('Ano', controller.selectedIcmPeriod.value == 'Ano'),
        ],
      ),
    ));
  }

  Widget _buildPeriodButton(String period, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.updateIcmPeriod(period),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            gradient: isSelected ? AppColor.primaryGradient : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            period,
            style: primaryTextStyle(
              color: isSelected ? Colors.white : Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      height: 300,
      child: Obx(() => BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barGroups: _buildBarGroups(),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: _buildBottomTitles,
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Disable left titles
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 30,
                showTitles: true,
                interval: _getIntervalForSelectedPeriod(),
                getTitlesWidget: (value, meta) {
                  String formattedValue = _formatYAxisLabels(value);
                  return Text(formattedValue, style: primaryTextStyle(fontSize: 10));
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Disable top titles
            ),
          ),
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
        ),
      )),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return controller.icmChartData.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.primaryGradient,
          ),
        ],
      );
    }).toList();
  }

  double _getIntervalForSelectedPeriod() {
    switch (controller.selectedIcmPeriod.value) {
      case 'Semana':
        return 2.0;  // Adjust as needed
      case 'Mês':
        return 5.0;  // Adjust as needed
      case 'Ano':
        return 10.0;  // Adjust as needed
      default:
        return 2.0;
    }
  }

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    const weeklyLabels = ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6', 'Day 7'];
    const monthlyLabels = ['Week 1', 'Week 2', 'Week 3', 'Week 4'];
    const annualLabels = ['Q1', 'Q2', 'Q3', 'Q4'];

    String text = '';

    if (controller.selectedIcmPeriod.value == 'Semana') {
      text = weeklyLabels[value.toInt()];
    } else if (controller.selectedIcmPeriod.value == 'Mês') {
      text = monthlyLabels[value.toInt()];
    } else if (controller.selectedIcmPeriod.value == 'Ano') {
      text = annualLabels[value.toInt()];
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(text, style: primaryTextStyle(fontSize: 12)),
    );
  }

  String _formatYAxisLabels(double value) {
    return '${value.toInt()} kg'; // Convert the value to int and append "kg"
  }
}


