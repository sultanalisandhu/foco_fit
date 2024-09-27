import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

AppBar kAppBar({
  final Function()? onTap,
  final Function()? trailingOnTap,
  final String? title,
  final String? trailingIcon,
}){
  return AppBar(
    leadingWidth: 70,
  scrolledUnderElevation: 0.0,
  elevation: 0.0,
  backgroundColor: Colors.transparent,
  leading: onTap != null ?GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(left: 20,top: 5,bottom: 5),
      padding: const EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.greyBorder)),
      child: const Icon(Icons.arrow_back_ios),
      ),
  ): const SizedBox.shrink(),
    title: title!=null
        ? Text(title,style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w600),)
        : const SizedBox.shrink(),
    centerTitle: true,
    actions: [
      trailingOnTap!= null
          ? GestureDetector(
        onTap: trailingOnTap,
        child: Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.greyBorder)),
          child: showSvgIconWidget(iconPath: trailingIcon??AppIcons.settingIcon,onTap: trailingOnTap),
        ),
      )
          : const SizedBox.shrink()
    ],
  );
}

AppBar kProfileAppBar({
  final Function()? onTileTap,
  final Function()? trailingOnTap,
  final String? imgPath,
  final String? title,
  final String? subTitle,
  final String? notificationCount,
}){
  return AppBar(
    leadingWidth: mQ.width,
    toolbarHeight: 90,
    backgroundColor: Colors.white,
    shadowColor: AppColor.blackColor.withOpacity(0.3),
    elevation: 5,
    surfaceTintColor: AppColor.whiteColor,
    leading: ListTile(
      onTap: onTileTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(imgPath!,),
      ),
      title: Text(title!),
      subtitle: Text(subTitle!),
      titleTextStyle: primaryTextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColor.blackColor),
      subtitleTextStyle: primaryTextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColor.blackColor),
      trailing: notificationCount!=null?Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
              height: 60,
              width: 70,
              child: Center(child: showSvgIconWidget(iconPath: AppIcons.bellIcon,onTap: trailingOnTap))),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.whiteColor
            ),
            child: Text(notificationCount,style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
          )
        ],
      ):GestureDetector(
        onTap: trailingOnTap,
        child: Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.greyBorder)),
          child: showSvgIconWidget(iconPath: AppIcons.settingIcon,onTap: trailingOnTap),
        ),
      ),
    ),
  );
}