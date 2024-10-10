import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_medical_conditions.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_weight.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class SelectHeight extends StatelessWidget {
  SelectHeight({super.key});

  final FixedExtentScrollController _cmController = FixedExtentScrollController();
  final FixedExtentScrollController _ftController = FixedExtentScrollController();
  final FixedExtentScrollController _inchController = FixedExtentScrollController();

  RxString selectedHeight = 'cm'.obs;
  RxInt heightInFt = 0.obs;
  RxInt heightInch = 0.obs;
  RxInt heightInCm = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
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
              AppStrings.howTallAreYou,
              style: primaryTextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              AppStrings.yourHeightHelpCalculateMass,
              style: primaryTextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
              Obx(()=>Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeightContainer(text: 'cm',
                        isSelected: selectedHeight.value == 'cm',
                        onTap: () {
                            selectedHeight.value='cm';
                        }),
                    20.width,
                    HeightContainer(text: 'ft/In',
                        isSelected: selectedHeight.value == 'ft/In',
                        onTap: () {
                            selectedHeight.value='ft/In';
                        }),
                  ],
                )),
              selectedHeight.value=='ft/In'
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ListWheelScrollView.useDelegate(
                      controller: _ftController,
                      onSelectedItemChanged: (value) {
                          heightInFt.value = value;
                      },
                      itemExtent: 65,
                      perspective: 0.006,
                      diameterRatio: 1.9,
                      physics: const FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 21,
                        builder: (context, index) {
                          return Obx(()=> Center(
                              child: index == heightInFt.value
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
                    'ft',
                    textAlign: TextAlign.end,
                    style: primaryTextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.black,),
                  ),
                  const SizedBox(width: 20), // Added SizedBox
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ListWheelScrollView.useDelegate(
                      controller: _inchController, // Use a different controller for the second ListWheelScrollView
                      onSelectedItemChanged: (value) {
                          heightInch.value = value;
                      },
                      itemExtent: 65,
                      perspective: 0.006,
                      diameterRatio: 1.9,
                      physics: const FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 13,
                        builder: (context, index) {
                          return Obx(()=> Center(
                            child: index ==heightInCm.value
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
                    'in',
                    textAlign: TextAlign.end,
                    style: primaryTextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.black,),
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ListWheelScrollView.useDelegate(
                      controller: _cmController,
                      onSelectedItemChanged: (value) {
                          heightInCm.value = value;
                      },
                      itemExtent: 65,
                      perspective: 0.006,
                      diameterRatio: 1.9,
                      physics: const FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 500,
                        builder: (context, index) {
                          return  Obx(()=>Center(child:
                            index == heightInCm.value
                                ? GradientText(text: index.toString(), gradient: AppColor.primaryGradient,style: primaryTextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600
                            ),)
                                : Text(
                              index.toString(),
                              style:  primaryTextStyle(fontSize: 32, fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),
                            )),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    'cm',
                    textAlign: TextAlign.end,
                    style: primaryTextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.black,),
                  ),
                ],),
              const Spacer(),
              kTextButton(
                onPressed: (){
                  Get.to(()=> SelectWeight());
                },
                btnText: AppStrings.continuue,
                useGradient: true,
              )
          ],),
        ),
      ),
    );
  }
}
class HeightContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const HeightContainer({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 100,
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: isSelected? AppColor.primaryGradient:null,
          border: Border.all(color: isSelected? AppColor.startGradient: Colors.black),
          color: isSelected ? AppColor.primaryColor : AppColor.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: KText(text: text,
            fontSize: 15,
            color: isSelected ? AppColor.whiteColor : Colors.black,
          ),
      ),
    );
  }
}