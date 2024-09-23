import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/fast_ui/fasting_screen.dart';
import 'package:focofit/screens/home_ui/home_screen.dart';
import 'package:focofit/screens/profile_ui/profile_screen.dart';
import 'package:focofit/screens/receipe_ui/receipe_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';


class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({super.key});
  final RxInt _currentIndex = 0.obs;
  final List<Widget> _pages = [
    HomeScreen(),
    FastingScreen(),
    RecipeScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      body: _pages[_currentIndex.value],
      bottomNavigationBar: Container(
        height: 80,
        width: mQ.width,
        decoration: const BoxDecoration(
            color: AppColor.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.lightGreyColor,
              spreadRadius: 5,
              blurRadius: 5
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            return InkWell(
              onTap: () {
                _currentIndex.value = index;
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    showSvgIconWidget(
                      onTap: (){
                        _currentIndex.value = index;
                      },
                      height:25,
                      iconPath: index== _currentIndex.value
                          ? filledIcons[index]
                          : listOfIcons[index],
                    ),
                    5.height,
                    GradientText(text: listofTitles[index], gradient: index==_currentIndex.value?AppColor.primaryGradient:AppColor.blackGradient,
                    style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    ) );
  }
  final List filledIcons= [
    AppIcons.filledHomeIcon,
    AppIcons.filledAlarmIcon,
    AppIcons.filledRecipeIcon,
    AppIcons.filledProfileIcon,
  ];
  final  List listOfIcons = [
  AppIcons.homeIcon,
  AppIcons.alarmIcon,
  AppIcons.recipeIcon,
  AppIcons.profileIcon,
  ];
  final List listofTitles = [
    'Diário',
    'Jejum',
    'Receitas',
    'Perfil'
  ];
}

