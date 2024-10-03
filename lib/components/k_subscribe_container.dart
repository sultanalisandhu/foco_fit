import 'package:flutter/material.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubScribedContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final Gradient? gradient;
  const SubScribedContainer({super.key, required this.onTap, required this.title, required this.subTitle,this.gradient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: mQ.width,
        padding: EdgeInsets.symmetric(vertical: 0.2.h,horizontal: 0.5.h),

        decoration: BoxDecoration(
          gradient: gradient?? AppColor.redGradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Image(image: AssetImage(AppImages.crownImg)),
          title:  KText(text: title, fontSize: 15,color: AppColor.whiteColor,),
          subtitle:   KText(text: subTitle, fontSize: 13,color: AppColor.whiteColor,),
        ),
      ),
    );
  }
}
