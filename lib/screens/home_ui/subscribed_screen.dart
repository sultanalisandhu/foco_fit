import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_data/home_data.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class SubscribedScreen extends StatefulWidget {
  const SubscribedScreen({super.key});

  @override
  _SubscribedScreenState createState() => _SubscribedScreenState();
}

class _SubscribedScreenState extends State<SubscribedScreen> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    confettiController = ConfettiController(duration: const Duration(seconds: 2));
    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConfettiWidget(
                confettiController: confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                minBlastForce: 0.8,
                blastDirection: 5.14,
                numberOfParticles: 25,
                gravity: 0.2,
                shouldLoop: false,
                colors: const [Colors.red, Colors.green, Colors.blue, Colors.yellow,AppColor.blackColor],
              ),
              20.height,
              Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColor.redGradient,
                ),
                child: const Image(
                  image: AssetImage(AppImages.crownImg),
                  height: 50,
                  width: 50,
                ),
              ),
              20.height,
              Text(
                'Congratulations!',
                style: primaryTextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              20.height,
              Text(
                'You\'ve upgraded to the Yearly subscription!',
                style: primaryTextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              10.height,
              Divider(
                height: 20,
                color: AppColor.lightGreyColor.withOpacity(0.2),
              ),
              Text(
                'Benefits Unlocked:',
                style: primaryTextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              for (int i = 0; i < subscriptionList.length; i++)
                ListTile(
                  leading: const Icon(Icons.check),
                  title: Text(
                    subscriptionList[i],
                    style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              Divider(
                height: 30,
                color: AppColor.lightGreyColor.withOpacity(0.2),
              ),
              Text(
                'Your subscription will automatically renew annually unless cancelled. Manage your subscription in your account setting.',
                textAlign: TextAlign.center,
                style: primaryTextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Divider(
                height: 30,
                color: AppColor.lightGreyColor.withOpacity(0.2),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: kTextButton(
          onPressed: () {
            Get.back();
          },
          btnText: 'Start Exploring premium features',
          useGradient: true,
          gradient: AppColor.redGradient,
          height: 50,
          width: MediaQuery.of(context).size.width,
          borderRadius: 26,
        ),
      ),
    );
  }
}
