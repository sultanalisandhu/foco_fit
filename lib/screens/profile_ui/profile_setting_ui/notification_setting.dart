import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

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
        title: 'Notificações'
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          children: [
            Obx(()=> SwitchListTile(
                  value: _enableNotification.value,
                  onChanged: (value){
                    _enableNotification.value= value;
                  },
                title: Text('Habilitar todas as notificações',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                shape: RoundedRectangleBorder(side: const BorderSide(color: AppColor.greyColor),borderRadius: BorderRadius.circular(10)),
                activeTrackColor: AppColor.startGradient,
                activeColor: AppColor.whiteColor,
              inactiveTrackColor: AppColor.greyColor.withOpacity(0.4),
              inactiveThumbColor: AppColor.whiteColor,
              trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
              
        
                  ),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.greyColor),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.lightGreyColor,
                    spreadRadius: 5,
                    blurRadius: 5
                  )
                ]
              ),
              child: Column(children: [
                Obx(()=> SwitchListTile(
                  value: _eatingReminder.value,
                  onChanged: (value){
                    _eatingReminder.value= value;
                  },
                  title: Text('Habilitar todas as notificações',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  // shape: RoundedRectangleBorder(side: const BorderSide(color: AppColor.greyColor),borderRadius: BorderRadius.circular(10)),
                  activeTrackColor: AppColor.startGradient,
                  activeColor: AppColor.whiteColor,
                  inactiveTrackColor: AppColor.greyColor.withOpacity(0.4),
                  inactiveThumbColor: AppColor.whiteColor,
                  trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
                ),),
                Divider(color: AppColor.greyColor.withOpacity(0.5),),
                ListTile(
                  title: Text(' Café da manhã'),
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
                  title: Text('Almoço'),
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
                  title: Text('Jantar'),
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
                  title: Text('Lanches'),
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
                border: Border.all(color: AppColor.greyColor),
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.lightGreyColor,
                    spreadRadius: 5,
                    blurRadius: 5
                  )
                ]
              ),
              child: Column(children: [
                Obx(()=> SwitchListTile(
                  value: _waterReminder.value,
                  onChanged: (value){
                    _waterReminder.value= value;
                  },
                  title: Text('Lembrete de beber água',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  activeTrackColor: AppColor.startGradient,
                  activeColor: AppColor.whiteColor,
                  inactiveTrackColor: AppColor.greyColor.withOpacity(0.4),
                  inactiveThumbColor: AppColor.whiteColor,
                  trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
                ),),
                Divider(color: AppColor.greyColor.withOpacity(0.5),),
                ListTile(
                  title: Text('Lembrar a cada'),
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
                  title: Text('Lembrar a partir de'),
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
            30.height,
            kTextButton(
              onPressed: (){},
              btnText: 'Salvar',
              useGradient: true,
            )

          ],
        ),
      ),
    );
  }
}
