import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/notification_setting.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: kAppBar(
        onTap: (){
          Navigator.pop(context);
        },
          trailingOnTap: (){
          Get.to(()=> NotificationSetting());
          },
        title: AppStrings.notifications
      ),
      body: Column(children: [
        1.ySpace,
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index){
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.lightGreyColor,
                    spreadRadius: 5,
                      blurRadius: 5
                  )
                ]
              ),
              child: ListTile(
                leading: showSvgIconWidget(iconPath: AppIcons.blackBellIcon),
                title: const KText(text:  'Lorem notificatins here you can check',fontSize: 13),
                trailing: GradientText(onTextTap: (){
                  _showBottomSheet(context,
                    onConfirmTap: (){Navigator.pop(context);},
                    onCancelTap: (){Navigator.pop(context);}
                );},
                  text: AppStrings.remove,
                  gradient: AppColor.primaryGradient,
                  style: kTextStyle(fontSize: 13),
                ),
                contentPadding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 5),
              ),
            );
          }),
        )
    ],),);
  }
  void _showBottomSheet(BuildContext context, {
    Function()? onConfirmTap,
    Function()? onCancelTap,
  }) {
    showModalBottomSheet(
      context: context,
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0),),
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: AppColor.whiteColor,
      builder: (BuildContext context) {
        return SizedBox(
          height: mQ.height * 0.31,
          width: mQ.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                showSvgIconWidget(iconPath: AppIcons.dashIcon),
                1.ySpace,
                KText(text: AppStrings.deleteNotification,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                ),
                const Divider(color: AppColor.lightGreyBorder,),
                1.ySpace,
                KText(text:
                  AppStrings.reallyDeleteNotification,
                  textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                ),
                const Spacer(),
               Row(
                 children: [
                   Expanded(
                     child: kTextButton(
                        height: 6,
                        width: mQ.width,
                        onPressed: onConfirmTap!,
                        btnText: AppStrings.noGoWantToBack,
                       fontSize: 14,
                       useGradient: true
                      ),
                   ),
                   1.xSpace,
                   Expanded(
                     child: KOutlineButton(
                       height:6,
                       onTap: onCancelTap!,
                       gradient: AppColor.blackGradient,
                       btnText: AppStrings.yesWantToDelete,
                       textGradient: AppColor.blackGradient,
                       fontSize: 14,

                     ),
                   )
                 ],
               ),
                1.ySpace,
              ],
            ),
          ),
        );
      },
    );}
}
