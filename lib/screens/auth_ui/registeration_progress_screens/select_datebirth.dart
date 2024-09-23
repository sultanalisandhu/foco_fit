import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_height.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class SelectDateBirth extends StatelessWidget {
  SelectDateBirth({super.key});

  final FixedExtentScrollController _dateController = FixedExtentScrollController();
  final FixedExtentScrollController _monthController = FixedExtentScrollController();
  final FixedExtentScrollController _yearController = FixedExtentScrollController();

  final RxInt currentDate = 1.obs;
  final RxInt currentMonth = 1.obs;
  final RxInt currentYear = 1990.obs;
  final int currentYearValue = DateTime.now().year;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: kAppBar(
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qual é a sua data de nascimento?',
              style: primaryTextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Sua idade nos ajuda a personalizar recomendações baseadas no seu estágio da vida e necessidades metabólicas.',
              style: primaryTextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Date ScrollView
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ListWheelScrollView.useDelegate(
                    controller: _dateController,
                    onSelectedItemChanged: (value) {
                      currentDate.value = value + 1;
                    },
                    itemExtent: 60,
                    perspective: 0.009,
                    diameterRatio: 2.5,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 31,
                      builder: (context, index) {
                        return Obx(() => Center(
                                    child:  index+1== currentDate.value
                                        ? GradientText(text: (index + 1).toString(),
                                      gradient: AppColor.primaryGradient,
                                      style: primaryTextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600,),)
                                        : Text(
                                      (index + 1).toString(),
                                      style: primaryTextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                        color:  Colors.black.withOpacity(0.6),
                                      ),),
                        )
                        );
                      },
                    ),
                  ),
                ),
                Text('/', style: primaryTextStyle(fontSize: 40)),
                /// Month ScrollView
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ListWheelScrollView.useDelegate(
                    controller: _monthController,
                    onSelectedItemChanged: (value) {
                      currentMonth.value = value + 1;
                    },
                    itemExtent: 60,
                    perspective: 0.009,
                    diameterRatio: 2.5,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 12,
                      builder: (context, index) {
                        return Obx(() => Center(
                                    child:  index+1== currentMonth.value
                                        ? GradientText(text: (index + 1).toString(),
                                      gradient: AppColor.primaryGradient,
                                      style: primaryTextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600,),)
                                        : Text(
                                      (index + 1).toString(),
                                      style: primaryTextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                        color:  Colors.black.withOpacity(0.6),
                                      ),),
                                  ),
                        );
                      },
                    ),
                  ),
                ),
                Text('/', style: primaryTextStyle(fontSize: 40)),
                // Year ScrollView
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ListWheelScrollView.useDelegate(
                    controller: _yearController,
                    onSelectedItemChanged: (value) {
                      currentYear.value = 1990 + value;
                    },
                    itemExtent: 60,
                    perspective: 0.009,
                    diameterRatio: 2.5,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: currentYearValue - 1990 + 1,
                      builder: (context, index) {
                        return Obx(() => Center(
                            child: 1990 + index== currentYear.value
                                ? GradientText(text: (1990 + index).toString(),
                                gradient: AppColor.primaryGradient,
                            style: primaryTextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,),)
                                : Text(
                              (1990 + index).toString(),
                              style: primaryTextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color:  Colors.black.withOpacity(0.6),
                              ),),
                          ),
                        );
                      },
                    ),
                  ),
                ),

              ],
            ),
            Spacer(),
            kTextButton(
                onPressed: (){
                  Get.to(()=> SelectHeight());
                },
                btnText: 'Continuar',
                useGradient: true
            )
          ],
        ),
      ),
    );
  }
}
