import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/splash_controller.dart';
import 'package:focofit/screens/auth_ui/welcome_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(SplashController()),
      builder: (c) {
        return Obx(()=>Scaffold(
            backgroundColor: AppColor.whiteColor,
            extendBodyBehindAppBar: true,
            body: SafeArea(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    child: Container(

                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: const BoxDecoration(gradient: AppColor.primaryGradient),
                      child: PageView.builder(
                        controller: c.pageController,
                        itemCount: c.images.length,
                        onPageChanged: (index) {
                            c.currentPage.value = index;
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            c.images[index],
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    c.tittleText[c.currentPage.value],
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    c.subTitleText[c.currentPage.value],
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      c.images.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 8,
                        width: c.currentPage.value == index ? 40 : 10,
                        decoration: BoxDecoration(
                          gradient: c.currentPage.value==index?AppColor.primaryGradient:null,
                          color: c.currentPage.value == index
                              ? null
                              : AppColor.startGradient.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  kTextButton(
                    btnText: 'Continuar',
                    onPressed: () {
                      if (c.currentPage.value < c.images.length - 1) {
                        c.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                          c.currentPage.value++;
                      } else {
                        Get.to(()=> const WelcomeScreen());
                      }
                    },
                    useGradient: true,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
