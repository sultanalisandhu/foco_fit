import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class ActivityChart extends StatelessWidget {
  final ChartsController controller;
  final String btnText;
  final Function() onButtonTap;

  const ActivityChart({super.key, required this.controller, required this.onButtonTap, required this.btnText});

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
              _buildActivityInfo('Duração total', controller.totalTimeInMinutes,'h'),
              _buildActivityInfo('Kcal queimadas', controller.totalCaloriesBurned,'kcal'),
            ],
          ),
          const SizedBox(height: 20),
          _buildPeriodButtons(),
          const SizedBox(height: 20),
          _buildBarChart(),
          kTextButton(btnText: btnText, onPressed: onButtonTap, useGradient: true)
        ],
      ),
    );
  }

  Widget _buildActivityInfo(String label, RxInt value, String unit) {
    return Column(
      children: [
        KText(text:  label,fontSize: 15,),
        Obx(() => KText(text: '${value.value} $unit',
          fontSize: 20, fontWeight: FontWeight.w700,
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
          _buildPeriodButton('Semana', controller.selectedActivityPeriod.value == 'Semana'),
          _buildPeriodButton('Mês', controller.selectedActivityPeriod.value == 'Mês' ),
          _buildPeriodButton('Ano', controller.selectedActivityPeriod.value == 'Ano'),
        ],
      ),
    ));
  }

  Widget _buildPeriodButton(String period, bool isSelected,) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.updateActivityPeriod(period),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            gradient: isSelected ? AppColor.primaryGradient : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: KText(text: period,
                color: isSelected ? Colors.white : Colors.orange,
                fontWeight: FontWeight.w600,
                fontSize: 14
          ),
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      height: 300,
      child: Obx(
            () => BarChart(
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
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 30,
                  showTitles: true,
                  interval: _getIntervalForSelectedPeriod(),
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${value.toInt()} m',
                      style: primaryTextStyle(fontSize: 10),
                    );
                  },
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            gridData: const FlGridData(show: false),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return controller.weeklyActivityData.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value['time']!.toDouble(),
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.purpelGradient,
          ),
        ],
      );
    }).toList();
  }

  double _getIntervalForSelectedPeriod() {
    switch (controller.selectedActivityPeriod.value) {
      case 'Semana':
        return 20;
      case 'Mês':
        return 30;
      case 'Ano':
        return 50;
      default:
        return 20;
    }
  }

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    const weeklyLabels = ['dom', 'seg', 'ter', 'qua', 'qui', 'sex', 'sáb'];
    const monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr','May','Jun','Jul'];
    const annualLabels = ['2017','2018', '2019', '2020', '2021', '2022', '2023'];

    String text = '';

    if (controller.selectedActivityPeriod.value == 'Semana') {
      if (value.toInt() < weeklyLabels.length) {
        text = weeklyLabels[value.toInt()];
      }
    } else if (controller.selectedActivityPeriod.value == 'Mês') {
      if (value.toInt() < monthlyLabels.length) {
        text = monthlyLabels[value.toInt()];
      }
    } else if (controller.selectedActivityPeriod.value == 'Ano') {
      if (value.toInt() < annualLabels.length) {
        text = annualLabels[value.toInt()];
      }
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(
        text,
        style: primaryTextStyle(fontSize: 12),
      ),
    );
  }
}
