import 'package:flutter/material.dart';
import 'package:focofit/screens/auth_ui/onboarding_screen.dart';
import 'package:focofit/screens/auth_ui/splash_screen.dart';
import 'package:focofit/screens/auth_ui/welcome_screen.dart';
import 'package:focofit/screens/home_ui/home_screen.dart';
import 'package:focofit/screens/nav_bar/k_bottom_navigation.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FocoFit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.whiteColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}



