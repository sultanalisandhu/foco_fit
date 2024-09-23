import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/notification_setting.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

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
        title: 'Notificações'
      ),
      body: Column(children: [
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
                title: const Text('Lorem notificatins here you can check'),
                trailing: showSvgIconWidget(iconPath: AppIcons.blackDeleteIcon,
                onTap: (){
                  _showBottomSheet(context,
                  onConfirmTap: (){},
                  onCancelTap: (){Navigator.pop(context);}
                  );
                }),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                titleTextStyle: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),
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
          height: mQ.height * 0.4,
          width: mQ.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                showSvgIconWidget(iconPath: AppIcons.dashIcon),
                20.height,
                Text(
                  'Excluir notificação',
                  style: primaryTextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                10.height,
                Text(
                  "Deseja realmente excluir esta notificação?Essa ação não pode ser desfeita.",
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
               kTextButton(
                  height: 60.0,
                  width: mQ.width,
                  borderRadius: 30.0,
                  onPressed: onConfirmTap!,
                  btnText: 'Não, quero voltar',
                 useGradient: true
                ),
                SizedBox(height: mQ.height * 0.02),
                KOutlineButton(
                  onTap: onCancelTap!,
                  gradient: AppColor.blackGradient,
                  btnText: 'Sim quero excluir',)
              ],
            ),
          ),
        );
      },
    );}
}
