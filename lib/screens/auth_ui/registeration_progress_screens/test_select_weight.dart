// import 'package:flutter/material.dart';
// import 'package:focofit/utils/app_colors.dart';
// import 'package:focofit/utils/k_text_styles.dart';
// import 'package:get/get.dart';
//
// class SelectWeight extends StatefulWidget {
//
//   const SelectWeight({super.key});
//
//   @override
//   State<SelectWeight> createState() => _SelectWeightState();
// }
//
// class _SelectWeightState extends State<SelectWeight> {
//   final int _totalCount = 100;
//   final int _initValue = 50;
//   int _currentValue = 50;
//   String selectedWeight = 'Kg';
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Obx(() => Scaffold(
//         appBar: AppBar(
//           title:  Text(
//             'Your Weight',
//             style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),
//           ),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             Text(
//               'Whats your current weight?',
//               style: primaryTextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.black,),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 WeightContainer(
//                   text: 'Kg',
//                   isSelected: selectedWeight == 'Kg',
//                   onTap: () {
//                     setState(() {
//                       selectedWeight = 'Kg';
//                     });
//                   },
//                 ),
//                 const SizedBox(width: 40),
//                 WeightContainer(
//                   text: 'Lb',
//                   isSelected: selectedWeight == 'Lb',
//                   onTap: () {
//                     setState(() {
//                       selectedWeight = 'Lb';
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 250,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(_currentValue.toString(),style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 64),),
//                       Text(selectedWeight,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w400),)
//
//                     ],),
//                   SizedBox(
//                     height: 80,
//                     child: WheelSlider(
//                       enableAnimation: false,
//                       interval: 2,
//                       lineColor: primaryColor,
//                       pointerColor: primaryColor,
//                       pointerHeight: 70,
//                       animationDuration: const Duration(seconds: 1),
//                       animationType: Curves.easeInCirc,
//                       totalCount: _totalCount,
//                       initValue: _initValue,
//                       onValueChanged: (val) {
//                         _currentValue = val;
//                         print(_currentValue.toString());
//                         setState(() {});
//                       },
//                       hapticFeedbackType: HapticFeedbackType.vibrate,
//                     ),
//                   ),
//                 ],
//               ),
//
//
//             )
//
//
//
//           ],
//         )));
//   }
// }
// class WeightContainer extends StatelessWidget {
//   final String text;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const WeightContainer({
//     Key? key,
//     required this.text,
//     required this.isSelected,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 35,
//         width: 64,
//         decoration: BoxDecoration(
//             border: Border.all(width: 1, color: isSelected ? AppColor.primaryColor : Colors.black),
//             color: isSelected ? AppColor.primaryColor : AppColor.primaryColor,
//             borderRadius: BorderRadius.circular(8)),
//         child: Center(child: Text(text,style: TextStyle(fontWeight: FontWeight.w400, color: isSelected ? Colors.white : Colors.black,),)),
//       ),
//     );
//   }
// }
//
