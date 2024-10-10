import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class NutrientsCharts extends StatelessWidget {
  final ChartsController controller;

  const NutrientsCharts({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: _containerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNutrientsInfoRow(),
          20.height,
          _buildPeriodButtons(),
          20.height,
          _buildLegend(),
          1.ySpace,
          _buildBarChart(),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const  KText(text: 'Macronutriente',fontSize: 15, fontWeight: FontWeight.w600),
              Row(
                children: [
                  const KText(text: 'Consumido',fontSize: 15, fontWeight: FontWeight.w600),
                  10.xSpace,
                  const KText(text: 'Meta',fontSize: 15, fontWeight: FontWeight.w600),
                ],
              ),
            ],
          ),
          10.height,
          _buildNutrientDetails(),
        ],
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: AppColor.whiteColor,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [AppColor.shadow],
    );
  }

  Widget _buildNutrientsInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNutrientsInfo('Carboidrato', controller.carbs),
        _buildNutrientsInfo('Proteína', controller.protein),
        _buildNutrientsInfo('Gordura', controller.fat),
      ],
    );
  }

  Widget _buildNutrientsInfo(String label, RxInt value) {
    return Column(
      children: [
        KText(text:  label,),
        Obx(() => KText(text: '${value.value} g',
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
          _buildPeriodButton('Semana', controller.selectedNutrientsPeriod.value == 'Semana'),
          _buildPeriodButton('Mês', controller.selectedNutrientsPeriod.value == 'Mês'),
          _buildPeriodButton('Ano', controller.selectedNutrientsPeriod.value == 'Ano'),
        ],
      ),
    ));
  }

  Widget _buildPeriodButton(String period, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.updateNutrientsPeriod(period),
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

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(AppColor.greenColor, 'Carboidrato'),
        1.xSpace,
        _buildLegendItem(AppColor.redColor, 'Proteína'),
        1.xSpace,
        _buildLegendItem(AppColor.endGradient, 'Gordura'),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Icon(Icons.linear_scale, color: color),
        KText(text:  label,fontSize: 14, fontWeight: FontWeight.w500),
      ],
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
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 40,
                showTitles: true,
                interval: _getIntervalForSelectedPeriod(),
                getTitlesWidget: (value, meta) {
                  return Text(
                    _formatValue(value.toInt()),
                    style: primaryTextStyle(fontSize: 10),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
        ),
      )),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    if (controller.nutrientsChartData.isEmpty) {
      return [];
    }
    return controller.nutrientsChartData.asMap().entries.map((entry) {
      int index = entry.key;
      var data = entry.value;
      double carbValue = data['carb'] ?? 0;
      double proteinValue = data['protein'] ?? 0;
      double fatValue = data['fat'] ?? 0;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: carbValue,
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.greenGradient,
          ),
          BarChartRodData(
            toY: proteinValue,
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.redGradient,
          ),
          BarChartRodData(
            toY: fatValue,
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.primaryGradient,
          ),
        ],
        barsSpace: 2,
      );
    }).toList();
  }


  double _getIntervalForSelectedPeriod() {
    switch (controller.selectedNutrientsPeriod.value) {
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

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    const weeklyLabels = ['31 dom', '1 seg', '2 ter', '3 qua', '4 qui', '5 sex', '6 sáb'];
    const monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];
    const annualLabels = ['2017', '2018', '2019', '2020', '2021', '2022', '2023'];

    String text = '';
    if (controller.selectedNutrientsPeriod.value == 'Semana') {
      text = _getLabelForValue(value, weeklyLabels);
    } else if (controller.selectedNutrientsPeriod.value == 'Mês') {
      text = _getLabelForValue(value, monthlyLabels);
    } else if (controller.selectedNutrientsPeriod.value == 'Ano') {
      text = _getLabelForValue(value, annualLabels);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(text, style: primaryTextStyle(fontSize: 12)),
    );
  }

  String _getLabelForValue(double value, List<String> labels) {
    return value.toInt() < labels.length ? labels[value.toInt()] : '';
  }

  String _formatValue(int value) {
    return value >= 1000 ? '${(value / 1000).toStringAsFixed(1)}k' : value.toString();
  }

  Widget _buildNutrientDetails() {
    return Column(
      children: [
        _buildNutrientDetailRow('Café da manhã', '2800 g', '1500 g'),
        _buildNutrientDetailRow('Almoço', '2800 g', '1500 g'),
      ],
    );
  }

  Widget _buildNutrientDetailRow(String meal, String participation, String calories) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(meal, style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        Text(participation, style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        Text(calories, style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
