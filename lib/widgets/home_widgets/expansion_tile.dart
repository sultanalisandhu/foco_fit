import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';

class CustomExpandableContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final List<Map<String, String>> childrenData;
  final VoidCallback? onTapTrailing;
  final VoidCallback? onSavePressed;
  final VoidCallback? onEditPressed;

  const CustomExpandableContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.childrenData,
    this.onTapTrailing,
    this.onSavePressed,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: const Border(
          left: BorderSide(color: AppColor.primaryColor, width: 8),
        ),
        boxShadow: const [
          AppColor.shadow,
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Row(
            children: [
              Text(
                title,
                style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              30.width,
              const Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,)
            ],
          ),
          subtitle: Text(
            subtitle,
            style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          leading: Image(image: AssetImage(imageUrl),),
          trailing: GestureDetector(
            onTap: onTapTrailing,
            child: Container(
              height: 40,
              width: 40,
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
          backgroundColor: AppColor.whiteColor,
          expandedAlignment: Alignment.topRight,
          collapsedIconColor: AppColor.primaryColor,
          iconColor: AppColor.primaryColor,
          tilePadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          collapsedBackgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          children: [
            for (var item in childrenData)
              Row(
                children: [
                  Text(
                    item['name'] ?? '',
                    style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const Expanded(child: Text('----------------')),
                  Text(
                    item['calories'] ?? '',
                    style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: kTextButton(
                      onPressed: onSavePressed!,
                      btnText: 'Salvar refeicao',
                      height: 40,
                      useGradient: true,
                      gradient: AppColor.blackGradient,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: kTextButton(
                      onPressed: onEditPressed!,
                      btnText: 'Editor historico',
                      height: 40,
                      useGradient: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
