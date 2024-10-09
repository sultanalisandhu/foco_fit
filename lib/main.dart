import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:focofit/screens/nav_bar/k_bottom_navigation.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/local_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller/language_controller.dart';

Languages languages = Languages();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await languages.loadTranslations();
  runApp(
      DevicePreview(
          enabled: false,
          builder: (context)=> const MyApp())
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String languageCode = LocalStorage.read(LocalStorage.languageCode) ?? 'pt';
    String countryCode = LocalStorage.read(LocalStorage.languageCountryCode)?? 'PT';
    print('languageCode ${languageCode}');
    print('countryCode ${countryCode}');
    return ResponsiveSizer(
      builder: (context,orientation,deviceType) {
        {
          return GetMaterialApp(
            title: 'FocoFit',
            debugShowCheckedModeBanner: false,
            locale: Locale("pt",'PT'),
            translations: languages,
            fallbackLocale: const Locale('pt_PT'),
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.whiteColor,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
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



