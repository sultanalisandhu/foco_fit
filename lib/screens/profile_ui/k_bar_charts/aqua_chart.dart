import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';


class AquaChart extends StatelessWidget {
  final ChartsController controller;
  final String btnText;
  final Function() onButtonTap;

  AquaChart({super.key, required this.controller, required this.onButtonTap, required this.btnText});

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
              _buildAquaInfo('Ingerido', controller.aquaConsumed),
              _buildAquaInfo('Meta mensal', controller.aquaGoal),
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

  Widget _buildAquaInfo(String label, RxInt value) {
    return Column(
      children: [
        KText(text:  label,fontSize: 15,),
        Obx(() => KText(text: '${value.value} L',
          fontSize: 20, fontWeight: FontWeight.w700),
        ),
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
          _buildPeriodButton('Semana', controller.selectedAquaPeriod.value == 'Semana', 'aqua'),
          _buildPeriodButton('Mês', controller.selectedAquaPeriod.value == 'Mês', 'aqua'),
          _buildPeriodButton('Ano', controller.selectedAquaPeriod.value == 'Ano', 'aqua'),
        ],
      ),
    ));
  }

  Widget _buildPeriodButton(String period, bool isSelected, String chartType) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.updateAquaPeriod(period),
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
                fontSize: 14,
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
                  showTitles: false, // Disable left titles
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 40,
                  showTitles: true, // Enable right titles
                  interval: _getIntervalForSelectedPeriod(),
                  getTitlesWidget: (value, meta) {
                    String formattedValue = _formatYAxisLabels(value);
                    return Text(
                      '$formattedValue L', // Add "L" for liters
                      style: primaryTextStyle(fontSize: 10),
                    );
                  },
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Disable top titles
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
    return controller.aquaChartData.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.blueGradient,
          ),
        ],
      );
    }).toList();
  }

  double _getIntervalForSelectedPeriod() {
    switch (controller.selectedAquaPeriod.value) {
      case 'Semana':
        return 200;
      case 'Mês':
        return 500;
      case 'Ano':
        return 1000;
      default:
        return 200;
    }
  }

  String _formatYAxisLabels(double value) {
    if (controller.selectedAquaPeriod.value == 'Semana' && value > 800) {
      return '${(value / 1000).toStringAsFixed(1)}';
    }
    if (controller.selectedAquaPeriod.value == 'Mês' && value >= 500) {
      return '${(value / 1000).toStringAsFixed(1)}';
    }
    if (controller.selectedAquaPeriod.value == 'Ano' && value >= 2000) {
      return '${(value / 1000).toStringAsFixed(1)}';
    }
    return value.toInt().toString();
  }

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    const weeklyLabels = ['31 dom', '1 seg', '2 ter', '3 qua', '4 qui', '5 sex', '6 sáb'];
    const monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr','May','Jun','Jul'];
    const annualLabels = ['2017','2018', '2019', '2020', '2021', '2022', '2023'];

    String text = '';

    if (controller.selectedAquaPeriod.value == 'Semana') {
      if (value.toInt() < weeklyLabels.length) {
        text = weeklyLabels[value.toInt()];
      }
    } else if (controller.selectedAquaPeriod.value == 'Mês') {
      if (value.toInt() < monthlyLabels.length) {
        text = monthlyLabels[value.toInt()];
      }
    } else if (controller.selectedAquaPeriod.value == 'Ano') {
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

