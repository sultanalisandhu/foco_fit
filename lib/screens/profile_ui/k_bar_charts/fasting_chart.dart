import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class FastingChart extends StatelessWidget {
  final ChartsController controller;
  final String btnText;
  final Function() onButtonTap;

  const FastingChart({
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
          _buildFastingInfo('Duração total', controller.fastingHistory),
          const SizedBox(height: 20),
          _buildPeriodButtons(),
          const SizedBox(height: 20),
          _buildBarChart(),
          kTextButton(
              btnText: btnText,
              onPressed: onButtonTap,
              useGradient: true
          ),
        ],
      ),
    );
  }

  Widget _buildFastingInfo(String label, RxInt value) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: primaryTextStyle(fontSize: 16)),
          Obx(() => Text(
            '${value.value} hours',
            style: primaryTextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }

  Widget _buildPeriodButtons() {
    return Obx(
          () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.greyBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildPeriodButton(
                'Semana', controller.selectedFastingPeriod.value == 'Semana'),
            _buildPeriodButton(
                'Mês', controller.selectedFastingPeriod.value == 'Mês'),
            _buildPeriodButton(
                'Ano', controller.selectedFastingPeriod.value == 'Ano'),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodButton(String period, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.updateFastingPeriod(period),
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
                fontSize: 16),
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
                    String formattedValue = _formatYAxisLabels(value);
                    return Text(
                      formattedValue,
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
    return controller.fastingChartData
        .asMap()
        .entries
        .map(
          (entry) => BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.primaryGradient,
          ),
        ],
      ),
    )
        .toList();
  }

  double _getIntervalForSelectedPeriod() {
    switch (controller.selectedFastingPeriod.value) {
      case 'Semana':
        return 2;
      case 'Mês':
        return 50;
      case 'Ano':
        return 100;
      default:
        return 2;
    }
  }


  String _formatYAxisLabels(double value) {
    if (controller.selectedFastingPeriod.value == 'Semana' && value > 10) {
      return '${(value / 10).toStringAsFixed(1)}h';
    }

    if (controller.selectedFastingPeriod.value == 'Mês' && value >= 50) {
      return '${(value / 10).toStringAsFixed(1)}h';
    }

    if (controller.selectedFastingPeriod.value == 'Ano' && value >= 100) {
      return '${(value / 10).toStringAsFixed(1)}h';
    }

    return value.toInt().toString();
  }

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    const weeklyLabels = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];
    const monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr'];
    const annualLabels = ['2019', '2020', '2021', '2022', '2023'];

    String text = '';

    if (controller.selectedFastingPeriod.value == 'Semana') {
      text = weeklyLabels[value.toInt()];
    } else if (controller.selectedFastingPeriod.value == 'Mês') {
      text = monthlyLabels[value.toInt()];
    } else if (controller.selectedFastingPeriod.value == 'Ano') {
      text = annualLabels[value.toInt()];
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
