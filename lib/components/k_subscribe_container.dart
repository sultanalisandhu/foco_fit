import 'package:flutter/material.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

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
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        decoration: BoxDecoration(
          gradient: gradient?? AppColor.redGradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: const Image(image: AssetImage(AppImages.crownImg)),
          title:  Text(title,style: primaryTextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
          subtitle:   Text(subTitle,style: primaryTextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.w400,fontSize: 14),),
        ),
      ),
    );
  }
}
