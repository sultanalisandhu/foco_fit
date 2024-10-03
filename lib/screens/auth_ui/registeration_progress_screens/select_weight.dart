import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/goal_weight.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class SelectWeight extends StatelessWidget {
  SelectWeight({super.key});
  final FixedExtentScrollController _kgController = FixedExtentScrollController();
  final FixedExtentScrollController _grController = FixedExtentScrollController();

 final  RxInt selectedWeightKg = 0.obs;
 final RxInt selectedWeightGr = 0.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
          onTap: (){
            Navigator.pop(context);
          }
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.whatYourCurrentWeight,
              style: primaryTextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              AppStrings.knowingYourCurrentWeightHelpGoals,
              style: primaryTextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ListWheelScrollView.useDelegate(
                    controller: _kgController,
                    onSelectedItemChanged: (value) {
                      selectedWeightKg.value = value;
                    },
                    itemExtent: 65,
                    perspective: 0.006,
                    diameterRatio: 1.9,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 120,
                      builder: (context, index) {
                        return Obx(()=> Center(
                          child: index == selectedWeightKg.value
                              ? GradientText(text: index.toString(), gradient: AppColor.primaryGradient,style: primaryTextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600
                          ),)
                              : Text(
                            index.toString(),
                            style:  primaryTextStyle(fontSize: 32, fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        );
                      },
                    ),
                  ),
                ),
                Text(
                  'Kg',
                  textAlign: TextAlign.end,
                  style: primaryTextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.black,),
                ),
                const SizedBox(width: 20), // Added SizedBox
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ListWheelScrollView.useDelegate(
                    controller: _grController, // Use a different controller for the second ListWheelScrollView
                    onSelectedItemChanged: (value) {
                      selectedWeightGr.value = value;
                    },
                    itemExtent: 65,
                    perspective: 0.006,
                    diameterRatio: 1.9,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 1000,
                      builder: (context, index) {
                        return Obx(()=> Center(
                          child: index ==selectedWeightGr.value
                              ? GradientText(text: index.toString(), gradient: AppColor.primaryGradient,style: primaryTextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600
                          ),)
                              : Text(
                            index.toString(),
                            style:  primaryTextStyle(fontSize: 32, fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        );
                      },
                    ),
                  ),
                ),
                Text(
                  'Gr',
                  textAlign: TextAlign.end,
                  style: primaryTextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.black,),
                ),
              ],
            ),
            const Spacer(),
            kTextButton(
              onPressed: (){
                Get.to(()=> GoalWeight());
              },
              btnText: AppStrings.continuue,
              useGradient: true,
            )
          ],),
      ),
    );
  }
}