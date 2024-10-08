///home screen water increment decrement

// Row(
// mainAxisSize: MainAxisSize.min,
// children: [
// /// Decrement in ListWheelScrollView
// GestureDetector(
// onTap: () {
// // Decrement the selected index
// if (selectedWeightKg.value > 0) {
// selectedWeightKg.value--;
// kgController.animateToItem(
// selectedWeightKg.value,
// duration: const Duration(milliseconds: 300),
// curve: Curves.easeInOut,
// );
// }
// },
// child: Container(
// height: 4.5.h,
// width: 10.w,
// decoration: const BoxDecoration(
// gradient: AppColor.primaryGradient,
// shape: BoxShape.circle,
// ),
// child: const Icon(
// Icons.remove,
// color: AppColor.whiteColor,
// ),
// ),
// ),
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.2,
// width: MediaQuery.of(context).size.width * 0.15,
// child: ListWheelScrollView.useDelegate(
// controller: kgController,
// onSelectedItemChanged: (value) {
// selectedWeightKg.value = value;
// },
// itemExtent: 20,
// perspective: 0.006,
// diameterRatio: 1.6,
// physics: const FixedExtentScrollPhysics(),
// childDelegate: ListWheelChildBuilderDelegate(
// childCount: 120,
// builder: (context, index) {
// return Obx(
// () => Center(
// child: KText(
// text: index.toString(),
// fontSize: index == selectedWeightKg.value ? 16 : 15,
// fontWeight: index == selectedWeightKg.value
// ? FontWeight.w600
//     : FontWeight.w400,
// color: AppColor.greyColor,
// ),
// ),
// );
// },
// ),
// ),
// ),
// /// Increment in ListWheelScrollView
// GestureDetector(
// onTap: () {
// // Increment the selected index
// if (selectedWeightKg.value < 119) {
// selectedWeightKg.value++;
// kgController.animateToItem(
// selectedWeightKg.value,
// duration: const Duration(milliseconds: 300),
// curve: Curves.easeInOut,
// );
// }
// },
// child: Container(
// height: 4.5.h,
// width: 10.w,
// decoration: const BoxDecoration(
// gradient: AppColor.primaryGradient,
// shape: BoxShape.circle,
// ),
// child: const Icon(
// Icons.add,
// color: AppColor.whiteColor,
// ),
// ),
// ),
// ],
// ),