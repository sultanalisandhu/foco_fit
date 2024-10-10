import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationSetting extends StatelessWidget {
   NotificationSetting({super.key});
  final RxBool _enableNotification= false.obs;
  final RxBool _eatingReminder= false.obs;
  final RxBool _waterReminder= false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: kAppBar(
          onTap: (){
            Navigator.pop(context);
          },
          title: AppStrings.notifications
      ),
      bottomNavigationBar: kTextButton(
        onPressed: (){},
        btnText: AppStrings.save,
        useGradient: true,
      ).paddingSymmetric(horizontal: 4.w,vertical: 2.h),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          children: [
            CustomSwitchTile(
              value: _enableNotification,
              onChanged: (v) {
                _enableNotification.value = v;
              },
              title: AppStrings.enableAllNotifications,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.lightGreyBorder),
                  boxShadow: const [
                    AppColor.shadow
                  ]
              ),
              child: Column(children: [
                CustomSwitchTile(
                  value: _eatingReminder,
                  onChanged: (v) {
                    _eatingReminder.value = v;
                  },
                  title: AppStrings.mealEatingReminder,
                ),
                Divider(color: AppColor.greyColor.withOpacity(0.5),),
                ListTile(
                  title: Text(AppStrings.breakFast),
                  titleTextStyle: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  subtitle: Divider( color: AppColor.greyColor.withOpacity(0.5),),
                  trailing: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.greyColor.withOpacity(0.4))
                    ),
                    child: Text('08:00',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ),
                ListTile(
                  title: Text(AppStrings.lunch),
                  titleTextStyle: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  subtitle: Divider( color: AppColor.greyColor.withOpacity(0.5),),
                  trailing: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.greyColor.withOpacity(0.4))
                    ),
                    child: Text('12:00',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ),
                ListTile(
                  title: Text(AppStrings.toHaveLunch),
                  titleTextStyle: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  subtitle: Divider( color: AppColor.greyColor.withOpacity(0.5),),
                  trailing: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.greyColor.withOpacity(0.4))
                    ),
                    child: Text('18:00',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ),
                ListTile(
                  title: Text(AppStrings.snacks),
                  titleTextStyle: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  subtitle: Divider( color: AppColor.greyColor.withOpacity(0.5),),
                  trailing: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.greyColor.withOpacity(0.4))
                    ),
                    child: Text('15:00',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ),
              ],),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.lightGreyBorder),
                  boxShadow: const [
                    AppColor.shadow
                  ]
              ),
              child: Column(children: [
                CustomSwitchTile(
                  value: _waterReminder,
                  onChanged: (v) {
                    _waterReminder.value = v;
                  },
                  title: AppStrings.drinkWaterReminder,
                ),
                Divider(color: AppColor.greyColor.withOpacity(0.5),),
                ListTile(
                  title: Text(AppStrings.rememberEvery),
                  titleTextStyle: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  subtitle: Divider( color: AppColor.greyColor.withOpacity(0.5),),
                  trailing: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.greyColor.withOpacity(0.4))
                    ),
                    child: Text('6 horas',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ),
                ListTile(
                  title: Text(AppStrings.rememberFrom),
                  titleTextStyle: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  subtitle: Divider( color: AppColor.greyColor.withOpacity(0.5),),
                  trailing: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.greyColor.withOpacity(0.4))
                    ),
                    child: Text('08:00',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ),
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
