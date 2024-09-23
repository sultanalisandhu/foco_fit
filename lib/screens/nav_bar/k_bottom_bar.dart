// import 'package:flutter/material.dart';
// import 'package:focofit/components/k_svg_icon.dart';
// import 'package:focofit/screens/alarm_ui/alarm_screen.dart';
// import 'package:focofit/screens/home_ui/home_screen.dart';
// import 'package:focofit/screens/profile_ui/profile_screen.dart';
// import 'package:focofit/screens/receipe_ui/receipe_screen.dart';
// import 'package:focofit/utils/app_colors.dart';
// import 'package:focofit/utils/asset_utils.dart';
// import 'package:get/get.dart';
//
// class KBottomBar extends StatelessWidget {
//    KBottomBar({super.key,});
//
//   final RxInt selectedIndexBottomNavBar=0.obs;
//
//   static const List<String> listOfBottomNavBarIcons = [
//     AppIcons.homeIcon,
//     AppIcons.alarmIcon,
//     AppIcons.receipeIcon,
//     AppIcons.profileIcon
//   ];
//
//   static final List<Widget> pagesOfBottomNavBarIcons = [
//     const HomeScreen(),
//     const AlarmScreen(),
//     const RecipeScreen(),
//     const ProfileScreen(),
//   ];
//
//   Widget _buildBottomNavBarIcon(int index) {
//     final bool isSelected = index == selectedIndexBottomNavBar.value;
//     return GestureDetector(
//       onTap: () => selectedIndexBottomNavBar.value = index,
//       child: CircleAvatar(
//         backgroundColor:
//         isSelected ? AppColor.primaryColor : AppColor.whiteColor,
//         child: showSvgIconWidget(
//           iconPath:
//           listOfBottomNavBarIcons[index],
//           color: isSelected ? AppColor.primaryColor : null,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBottomNavBar() {
//     return Container(
//       width: mQ.width,
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       margin: const EdgeInsets.only(right: 35, left: 35, bottom: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             color: AppColor.primaryColor.withOpacity(0.1),
//             spreadRadius: 2,
//             blurRadius: 15,
//             offset: const Offset(0, 0),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: List.generate(
//           listOfBottomNavBarIcons.length,
//               (index) => _buildBottomNavBarIcon(index),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SizedBox(
//         height: mQ.height,
//         width: mQ.width,
//         child: Obx(
//               () => Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               pagesOfBottomNavBarIcons[selectedIndexBottomNavBar.value],
//               _buildBottomNavBar(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }