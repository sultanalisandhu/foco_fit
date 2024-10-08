// import 'package:flutter/material.dart';
// import 'package:focofit/utils/app_colors.dart';
// import 'package:focofit/utils/k_text_styles.dart';
// import 'package:get/get.dart';
//
// class ChangeAppLanguage extends StatelessWidget {
//   const ChangeAppLanguage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AuthController>(
//         init: AuthController(),
//         builder: (c) {
//           return Scaffold(
//             backgroundColor: AppColor.whiteColor,
//             appBar: AppBar(
//               backgroundColor: AppColor.lightGreyColor,
//               title: Text('AppStrings.languageTitle',style: primaryTextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 17.0,
//                 color: Colors.white,
//               )),
//               leading: IconButton(
//                 onPressed: (){
//                   Get.back();
//                 },
//                 icon: const Icon(Icons.arrow_back_ios_new,size: 18),),
//               iconTheme: const IconThemeData(
//                   color: Colors.white
//               ),
//             ),
//             body: Stack(
//               fit: StackFit.expand,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 20, right: 10,),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                             'AppStrings.switchLanguage',
//                             style: primaryTextStyle(
//                               fontSize: 22.0,
//                               fontWeight: FontWeight.w700,
//                             )
//                         ),
//                         Text(
//                           'AppStrings.switchLanguageToEnjoyTHeApp',
//                           style: primaryTextStyle(color: Colors.red, fontSize: 13.0,fontWeight: FontWeight.w400),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(bottom: mQ.height * 0.1),
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: 2,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemBuilder: (ctx, index) {
//                               return Obx(() {
//                                 bool isSelected = c.selectedLanguageIndex.value == index; // Check if the current language is selected
//                                 return GestureDetector(
//                                   onTap: () {
//                                     c.switchLanguage(index); // Switch language on tap
//                                   },
//                                   child: Container(
//                                     margin: const EdgeInsets.only(bottom: 12.0),
//                                     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 12.0),
//                                     decoration: BoxDecoration(
//                                       color: settingCardBgColor,
//                                       borderRadius: BorderRadius.circular(50.0),
//                                       border: Border.all(
//                                         color: isSelected ? kWhiteColor : Colors.transparent,
//                                         width: 1.5,
//                                       ),
//                                     ),
//                                     child: Text(
//                                       c.appLanguage[index].toString(),
//                                       style: customTextStyle(fontSize: 14.0, color: kWhiteColor, fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 );
//                               });
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 Positioned(
//                   bottom: 20,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                     child: SizedBox(
//                       height: buttonHeight / 1.0,
//                       width: kSize.width * 0.9,
//                       child: kGradientPrimaryColorButton(
//                         text: AppStrings.continueText,
//                         onPressed: () {
//                           if(c.selectedLanguageIndex.value == 0){
//                             Get.updateLocale(const Locale('en', 'US'));
//                             LogUtil.info('English set as default Language');
//                             LocalStorage.writeSelectedLanguageName("English");
//                             LocalStorage.writeSelectedLanguage("en");
//                             LocalStorage.writeSelectedCountryCode("US");
//                           }else if (c.selectedLanguageIndex.value == 1){
//                             Get.updateLocale(const Locale('es', 'ES'));
//                             LocalStorage.writeSelectedLanguageName("Spanish");
//                             LocalStorage.writeSelectedLanguage("es");
//                             LocalStorage.writeSelectedCountryCode("ES");
//                             LogUtil.info('Spanish set as default Language');
//                           } else if (c.selectedLanguageIndex.value == 2){
//                             Get.updateLocale(const Locale('ja', 'JP'));
//                             LocalStorage.writeSelectedLanguageName("Japanese");
//                             LocalStorage.writeSelectedLanguage("ja");
//                             LocalStorage.writeSelectedCountryCode("JP");
//                             LogUtil.info('Japanese set as default Language');
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
// //......................ui
