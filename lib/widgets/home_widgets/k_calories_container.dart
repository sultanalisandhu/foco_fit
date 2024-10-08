import 'package:flutter/material.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class CaloriesContainer extends StatelessWidget {
  final String title;
  final String consumedTitle;
  final String burnTitle;
  final String totalCalories;
  final String calories;
  final String consumed;
  final String burned;
  final double progress;
  final String carbohydrate;
  final double carbPercent;
  final String protein;
  final double proteinPercent;
  final String fat;
  final double fatPercent;

  const CaloriesContainer({
    super.key,
    required this.title,
    required this.totalCalories,
    required this.consumed,
    required this.burned,
    required this.progress,
    required this.carbohydrate,
    required this.carbPercent,
    required this.protein,
    required this.proteinPercent,
    required this.fat,
    required this.fatPercent,
    required this.consumedTitle,
    required this.burnTitle,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColor.lightGreyColor,
            blurRadius: 5,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ColoredBox(
                  color: AppColor.whiteColor,
                  child: _buildDistanceTrackerExample()),
              Positioned(
                top: 30,
                left: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(text: title,fontWeight: FontWeight.w500,fontSize: 15 ,),
                        KText(text: totalCalories,fontWeight: FontWeight.w700,fontSize: 18),
                        KText(text: consumedTitle,fontWeight: FontWeight.w500,fontSize: 15 ,),
                        KText(text: consumed,fontWeight: FontWeight.w700,fontSize: 18),
                        KText(text: burnTitle,fontWeight: FontWeight.w500,fontSize: 15 ,),
                        KText(text: burned,fontWeight: FontWeight.w700,fontSize: 18),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(text: AppStrings.carbohydrate,fontSize: 13, fontWeight: FontWeight.w500),
                        KText(text: carbohydrate, fontWeight: FontWeight.w500),
                        1.ySpace,
                        LinearPercentIndicator(
                          animation: true,
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColor.lightGreyColor,
                          linearGradient: AppColor.greenGradient,
                          linearStrokeCap: LinearStrokeCap.butt,
                          barRadius: const Radius.circular(12),
                          animationDuration: 1000,
                          lineHeight: 12.0,
                          percent: carbPercent,
                        ),
                      ],
                    ),
                  ),
                  10.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(text: AppStrings.protein,fontSize: 13, fontWeight: FontWeight.w500),
                        KText(text: protein, fontWeight: FontWeight.w500),
                        1.ySpace,
                        LinearPercentIndicator(
                          animation: true,
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColor.lightGreyColor,
                          linearGradient: AppColor.redGradient,
                          linearStrokeCap: LinearStrokeCap.butt,
                          barRadius: const Radius.circular(12),
                          animationDuration: 1000,
                          lineHeight: 12.0,
                          percent: proteinPercent,
                        ),
                      ],
                    ),
                  ),
                 10.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(text: AppStrings.fat,fontSize: 13, fontWeight: FontWeight.w500),
                        KText(text: fat, fontWeight: FontWeight.w500),
                        LinearPercentIndicator(
                          animation: true,
                          padding: EdgeInsets.zero,
                          linearGradient: AppColor.primaryGradient,
                          backgroundColor: AppColor.lightGreyColor,
                          linearStrokeCap: LinearStrokeCap.butt,
                          barRadius: const Radius.circular(12),
                          animationDuration: 1000,
                          lineHeight: 12.0,
                          percent: fatPercent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
  Widget _buildDistanceTrackerExample() {
    return SizedBox(
      height: 300,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            showLabels: false,
            showTicks: false,
            radiusFactor: 0.6,
            maximum: 100,
            endAngle: 35,
            startAngle: 145,
            minimum: 0,
            centerX: 0.7,
            centerY: 0.4,
            axisLineStyle: const AxisLineStyle(
              cornerStyle: CornerStyle.bothCurve,
              thickness: 12,
              color: AppColor.lightGreyColor,
            ),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                angle: 60,
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    KText(text: totalCalories ,fontSize: 19, fontWeight: FontWeight.w800),
                    KText(text: calories ,fontWeight: FontWeight.w600)
                  ],
                ),
                verticalAlignment: GaugeAlignment.far,
              ),
            ],
            pointers: const <GaugePointer>[
               RangePointer(
                value: 60,
                width: 15,
                pointerOffset: -5,
                cornerStyle: CornerStyle.bothCurve,
                gradient: SweepGradient(
                  colors: <Color>[AppColor.startGradient, AppColor.endGradient],
                  stops: <double>[0.5, 0.8],
                ),
              ),
            ],


          ),
        ],
      ),
    );
  }
}
