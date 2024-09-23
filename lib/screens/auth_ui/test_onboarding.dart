// import 'package:flutter/material.dart';
// import 'package:focofit/components/k_buttons.dart';
// import 'package:focofit/controller/splash_controller.dart';
// import 'package:focofit/screens/auth_ui/welcome_screen.dart';
// import 'package:focofit/utils/app_colors.dart';
// import 'package:focofit/utils/k_text_styles.dart';
// import 'package:get/get.dart';
//
// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SplashController>(
//       init: Get.put(SplashController()),
//       builder: (c) {
//         return Obx(
//               () => Scaffold(
//             backgroundColor: AppColor.whiteColor,
//             extendBodyBehindAppBar: true,
//             body: Stack(
//               children: [
//                 /// Image Container - Background
//                 Container(
//                   padding: EdgeInsets.all(25),
//                   height: MediaQuery.of(context).size.height,
//                   decoration: const BoxDecoration(gradient: AppColor.gradient),
//                   child: PageView.builder(
//                     controller: c.pageController,
//                     itemCount: c.images.length,
//                     onPageChanged: (index) {
//                       c.currentPage.value = index;
//                     },
//                     itemBuilder: (context, index) {
//                       return Image.asset(
//
//                         c.images[index],
//                         fit: BoxFit.contain,
//                       );
//                     },
//                   ),
//                 ),
//                 /// Text Container positioned on top of the image at the bottom
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: ClipPath(
//                     clipper: TopInsideCurveClipper(),
//                     child: Container(
//                       height: MediaQuery.of(context).size.height*0.5,
//                       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//                       decoration: BoxDecoration(
//                         color: AppColor.whiteColor,
//                         borderRadius: BorderRadius.circular(0), // No need for default borders
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             c.tittleText[c.currentPage.value],
//                             textAlign: TextAlign.center,
//                             style: primaryTextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             c.subTitleText[c.currentPage.value],
//                             textAlign: TextAlign.center,
//                             style: primaryTextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: List.generate(
//                               c.images.length,
//                                   (index) => AnimatedContainer(
//                                 duration: const Duration(milliseconds: 300),
//                                 margin: const EdgeInsets.symmetric(horizontal: 5),
//                                 height: 8,
//                                 width: c.currentPage.value == index ? 40 : 10,
//                                 decoration: BoxDecoration(
//                                   gradient: c.currentPage.value == index
//                                       ? AppColor.gradient
//                                       : null,
//                                   color: c.currentPage.value == index
//                                       ? null
//                                       : AppColor.startGradient.withOpacity(0.4),
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           kTextButton(
//                             btnText: 'Continuar',
//                             onPressed: () {
//                               if (c.currentPage.value < c.images.length - 1) {
//                                 c.pageController.nextPage(
//                                   duration: const Duration(milliseconds: 300),
//                                   curve: Curves.easeIn,
//                                 );
//                                 c.currentPage.value++;
//                               } else {
//                                 Get.to(() => const WelcomeScreen());
//                               }
//                             },
//                             useGradient: true,
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class TopInsideCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     // Start from the bottom left
//     path.lineTo(0, size.height);
//
//     // Draw line to the start of the inside curve
//     path.lineTo(0, 60);
//
//     // Draw a deeper inward curve at the top
//     path.quadraticBezierTo(
//       size.width * 0.5, -30, // Control point for a deeper curve inside
//       size.width, 60, // End point of the curve
//     );
//
//     // Continue to bottom right
//     path.lineTo(size.width, size.height);
//
//     // Close the path
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
//
