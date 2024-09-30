import 'package:flutter/material.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:percent_indicator/percent_indicator.dart';


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
        color: Colors.white, // Replace with AppColor.whiteColor
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(totalCalories, style: primaryTextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
                  Text(consumedTitle, style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(consumed, style: primaryTextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
                  Text(burnTitle, style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(burned, style: primaryTextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
                ],
              ),
              CircularPercentIndicator(
                animationDuration: 1000,
                linearGradient: AppColor.primaryGradient, // Replace with AppColor.gradient
                animation: true,
                restartAnimation: true,
                rotateLinearGradient: true,
                backgroundColor: AppColor.lightGreyColor, // Replace with AppColor.lightGreyColor
                fillColor: Colors.transparent,
                circularStrokeCap: CircularStrokeCap.round,
                radius: 80,
                lineWidth: 15,
                backgroundWidth: 17,
                percent: progress,
                curve: Curves.easeIn,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(text: totalCalories, gradient: AppColor.primaryGradient, style: primaryTextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                    Text(calories, style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
          15.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.carbohydrate, style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                    Text(carbohydrate, style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.protein, style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                    Text(protein, style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.fat, style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                    Text(fat, style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
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
    );
  }
}
