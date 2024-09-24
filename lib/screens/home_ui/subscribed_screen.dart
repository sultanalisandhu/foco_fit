import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_data/home_data.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

class SubscribedScreen extends StatelessWidget {
  const SubscribedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.height,
            Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColor.redGradient,
              ),
              child: Image(image: AssetImage(AppImages.crownImg),height: 50,width: 50,),
            ),
              20.height,
              Text('Congratulations!',style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              20.height,
              Text('You\'ve upgraded to the Yearly subscription!',style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              10.height,
              Divider(
                height: 20,
                color: AppColor.lightGreyColor.withOpacity(0.2),
              ),
              Text('Benefits Unlocked:',style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              for(int i=0; i<subscriptionList.length;i++ )
                ListTile(
                    leading: const Icon(Icons.check),
                  title: Text(subscriptionList[i],style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                ),
              Divider(
                height: 30,
                color: AppColor.lightGreyColor.withOpacity(0.2),
              ),
              Text('Your subscription will automatically renew annually unless cancelled. Manage your subscription in your account setting.',
                textAlign: TextAlign.center,
                style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              Divider(
                height: 30,
                color: AppColor.lightGreyColor.withOpacity(0.2),
              ),
            ],),
        ),
      ),

      bottomNavigationBar:  Container(
        height: mQ.height*0.1,
        padding: const  EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: kTextButton(
          onPressed: (){},
          btnText: 'Start Exploring premium features',
          useGradient: true,
          gradient: AppColor.redGradient,height: 50,width: mQ.width,borderRadius: 26,),
      ),
    );
  }
}
