import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/main.dart';
import 'package:focofit/screens/nav_bar/k_bottom_bar.dart';
import 'package:focofit/screens/nav_bar/k_bottom_navigation.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class LetsStart extends StatelessWidget {
  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
          Center(
            child: Column(children: [
              Text('Vamos começar!',style: primaryTextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
              Text('Lorem ipsum dolor sit amet. Ea quasi molestias vel corrupti veritatis et unde blanditiis qui enim nulla eos.',
                textAlign: TextAlign.center,
                style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
              Image(image: AssetImage(AppImages.letsStartImg)),
              Text('Lorem ipsum dolor sit amet. Ea quasi molestias vel corrupti veritatis et unde blanditiis.',
                textAlign: TextAlign.center,
                style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),

            ],),
          ),
            Spacer(),
            kTextButton(
                onPressed: (){
                  Get.offAll(()=> CustomBottomBar());
                },
                btnText: 'Começar',
                useGradient: true
            )
        ],),
      )
    );
  }
}
