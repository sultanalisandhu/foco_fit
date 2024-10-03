import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:focofit/screens/nav_bar/k_bottom_navigation.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller/language_controller.dart';

Languages languages = Languages();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await languages.loadTranslations();
  runApp(
      DevicePreview(
          enabled: true,
          builder: (context)=> const MyApp())
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context,orientation,deviceType) {
        {
          return GetMaterialApp(
            title: 'FocoFit',
            debugShowCheckedModeBanner: false,
            locale: const Locale('en_US'),
            translations: languages,
            fallbackLocale: const Locale('en_US'),
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.whiteColor,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColor.primaryColor),
              useMaterial3: true,
            ),
            home: CustomBottomBar(),
            // for checking the responsiveness of the app
            useInheritedMediaQuery: true,
          );
        }
      });
  }
}



