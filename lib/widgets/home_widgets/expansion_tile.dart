import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomExpandableContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final Color borderColor;
  final List<Map<String, String>> childrenData;
  final VoidCallback? onTapTrailing;
  final VoidCallback? onEditPressed;

  const CustomExpandableContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.childrenData,
    this.onTapTrailing,
    this.onEditPressed,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border:  Border(
          left: BorderSide(color: borderColor, width: 8),
        ),
        boxShadow: const [
          AppColor.shadow,
        ],
      ),
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            KText(text: title,fontWeight: FontWeight.w600,),
            2.xSpace,
            showSvgIconWidget(iconPath: AppIcons.arrowDownIcon)
          ],
        ),
        subtitle: KText(text: subtitle, fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.greyColor,),
        leading: Image(image: AssetImage(imageUrl),),
        trailing: GestureDetector(
          onTap: onTapTrailing,
          child: Container(
            height: 5.h,
            width: 15.w,
            decoration: const BoxDecoration(
              gradient: AppColor.primaryGradient,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: AppColor.whiteColor,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        expandedAlignment: Alignment.topRight,
        tilePadding: EdgeInsets.symmetric( horizontal: 2.w,vertical: 1.h),
        childrenPadding: EdgeInsets.only(bottom:  2.h,left: 4.w,right: 4.w),
        collapsedBackgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        children: [
          for (var item in childrenData)
            Row(
              children: [
                KText(
                  text: item['name'] ?? '',

                ),
                const Expanded(child: KText(text:'------------------------------------------------------------------------------',
                  maxLines: 1,fontSize: 12, color: AppColor.greyColor,)),
                KText(
                  text: item['calories'] ?? '',
                ),
              ],
            ),
          3.ySpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kTextButton(
                onPressed: onEditPressed!,
                btnText: AppStrings.historicalEditor,
                height: 5,
                useGradient: true,
                fontSize: 15,
                width: 60.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class KHomeListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String? subImageUrl;
  final Color borderColor;
  final Function()? onPressed;

  const KHomeListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.borderColor, this.subImageUrl,
    this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(color: borderColor, width: 8),
        ),
        boxShadow: const [
          AppColor.shadow,
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            KText(
              text: title,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            KText(
              text: subtitle,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.greyColor,
            ),
            subImageUrl!=null
                ? Image(
              image: AssetImage(subImageUrl!),
              height: 15,
              width: 15,
            )
                : const SizedBox.shrink(),
          ],
        ),
        leading: Image(
          image: AssetImage(imageUrl),
        ),
        trailing: kTextButton(
          onPressed: onPressed,
            height: 5,
            width: 30.w,
            fontSize: 15,
            btnText: AppStrings.register),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
