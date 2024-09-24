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
  final Function()? onTap,
  final Function()? trailingOnTap,
}){
  return AppBar(
    leadingWidth: mQ.width,
    toolbarHeight: 90,
    backgroundColor: Colors.white,
    shadowColor: AppColor.blackColor.withOpacity(0.3),
    elevation: 5,
    surfaceTintColor: AppColor.whiteColor,
    leading: ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
            'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?t=st=1726037514~exp=1726041114~hmac='
                'df5d8c90eb262717d2a532974732ce0c847b84a167232fe9b051e093d9d3bc61&w=1380'),
      ),
      title: Text('Boa tarde,'),
      subtitle: Text('Weslei Vicentini'),
      titleTextStyle: primaryTextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColor.blackColor),
      subtitleTextStyle: primaryTextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColor.blackColor),
      trailing: Stack(
        alignment: Alignment.center,
        children: [
          showSvgIconWidget(iconPath: AppIcons.bellIcon,onTap: trailingOnTap),
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.whiteColor
            ),
            child: Text('9',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
          )
        ],
      ),
    ),
  );
}