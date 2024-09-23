import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/splash_controller.dart';
import 'package:focofit/screens/auth_ui/welcome_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class KOnboardingScreen extends StatelessWidget {
  const KOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: Get.put(SplashController()),
      builder: (c) {
        return Obx(() => Scaffold(
          backgroundColor: AppColor.whiteColor,
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              /// Image Container - Background
              Container(
                padding: const EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height,
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
              /// Text Container positioned on top of the image at the bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child:
                /// i need To achieve an inward curve from the center of the Container
                ClipPath(
                  clipper: InwardCurveClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.45,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    decoration: const  BoxDecoration(
                        color: AppColor.whiteColor,
                        boxShadow: [
                          AppColor.shadow
                        ]
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
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
                        const Spacer(),
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
                                gradient: c.currentPage.value == index
                                    ? AppColor.primaryGradient
                                    : null,
                                color: c.currentPage.value == index
                                    ? null
                                    : AppColor.startGradient.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                              Get.to(() => const WelcomeScreen());
                            }
                          },
                          useGradient: true,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        );
      },
    );
  }
}

class InwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from the top left
    path.lineTo(0, 0);

    // Draw a curve inward from the center at the top
    var controlPoint = Offset(size.width / 2, 100); // Control point for the curve
    var endPoint = Offset(size.width, 0); // End point at the top right

    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    // Draw the remaining edges down to the bottom right
    path.lineTo(size.width, size.height); // Bottom right
    path.lineTo(0, size.height); // Bottom left
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}



