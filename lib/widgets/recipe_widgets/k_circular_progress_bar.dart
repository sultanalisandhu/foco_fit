import 'package:flutter/material.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:percent_indicator/percent_indicator.dart';

class KCircularProgressBar extends StatelessWidget {
  final String consumed;
  final String dietName;
  final LinearGradient lineGradient;
  final double progressValue;
  const KCircularProgressBar({super.key, required this.consumed, required this.dietName, required this.lineGradient, required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animationDuration: 1000,
      linearGradient: lineGradient,
      animation: true,
      restartAnimation: true,
      rotateLinearGradient: true,
      backgroundColor: AppColor.lightGreyColor,
      fillColor: Colors.transparent,
      circularStrokeCap: CircularStrokeCap.round,
      radius: 55,
      lineWidth: 6,
      backgroundWidth: 8,
      percent: progressValue,
      curve: Curves.easeIn,
      reverse: true,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientText(text: consumed, gradient: lineGradient, style: primaryTextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          Text(dietName,
              textAlign: TextAlign.center,
              style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w400,)),
        ],
      ),
    );
  }
}
