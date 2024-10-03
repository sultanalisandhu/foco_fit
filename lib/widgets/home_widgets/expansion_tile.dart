import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KText(text: title, fontSize: 14,fontWeight: FontWeight.w600,),
            const Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,)
          ],
        ),
        subtitle: KText(text: subtitle, fontSize: 12,fontWeight: FontWeight.w500,color: AppColor.greyColor,),
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
        tilePadding: EdgeInsets.symmetric( horizontal: 2.w),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        collapsedBackgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        children: [
          for (var item in childrenData)
            Row(
              children: [
                KText(
                  text: item['name'] ?? '',
                   fontWeight: FontWeight.w600,
                ),
                const Expanded(child: Text('------------------------------------------------------------------------------',maxLines: 1,)),
                KText(
                  text: item['calories'] ?? '',
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          1.ySpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kTextButton(
                onPressed: onEditPressed!,
                btnText: AppStrings.historicalEditor,
                height: 5,
                useGradient: true,
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
  final Color borderColor;
  final VoidCallback? onPlusTap;
  final VoidCallback? onMinusTap;

  const KHomeListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.onPlusTap, this.onMinusTap, required this.borderColor,

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
        contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            KText(text: title, fontSize: 14,fontWeight: FontWeight.w600,),
            KText(text: subtitle, fontSize: 12,fontWeight: FontWeight.w500,color: AppColor.greyColor),
            const Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,)
          ],
        ),
        leading: Image(image: AssetImage(imageUrl),),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onMinusTap,
              child: Container(
                height: 4.5.h,
                width: 10.w,
                decoration: const BoxDecoration(
                  gradient: AppColor.primaryGradient,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.remove,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
            2.xSpace,
            KText(text: '500',),
            2.xSpace,
            GestureDetector(
              onTap: onPlusTap,
              child: Container(
                height: 4.5.h,
                width: 10.w,
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
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}