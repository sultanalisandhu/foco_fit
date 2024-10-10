import 'package:flutter/material.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/k_bottom_sheets/profile_bottom_sheets/k_profile_sheets.dart';
import 'package:get/get.dart';

class WeightHistoryScreen extends StatelessWidget {
  const WeightHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: Get.put(ProfileController(), tag: 'profileController'),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            onTap: ()=>Navigator.pop(context),
            title: AppStrings.countryHistory,
            titleSize: 18
          ),
          body: Column(
            children: [
              ///show date range
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Display selected date range
                    Obx(() => Text(
                      c.selectedDateRange.value.isNotEmpty
                          ? c.selectedDateRange.value
                          : AppStrings.noDateSelected,
                      style: primaryTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                    GestureDetector(
                      onTap: () {
                        KProfileSheets.selectDateRange(
                          context,
                          controller: c,
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              10.height,
              Expanded(
                child: ListView.builder(
                    itemCount: 31,
                    itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('88,5 kg'),
                    subtitle: Text('Hoje, 12 de Agosto de 2024, às 10:41'),
                    subtitleTextStyle: primaryTextStyle(fontSize: 14,color: AppColor.greyColor),
                    titleTextStyle: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                    trailing: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min ,
                      children: [
                        Text('88,5 kg',style: primaryTextStyle(fontSize: 14,color: AppColor.redColor,fontWeight: FontWeight.w600),),
                        IconButton(onPressed: (){
                          KProfileSheets.editHistoricoSheet(context,
                              onConfirmTap: (){
                            Navigator.pop(context);
                            KProfileSheets.editWeightHistory(context,
                                onConfirmTap: (){Navigator.pop(context);});
                              },
                              onCancelTap: (){
                            Navigator.pop(context);
                          });

                        }, icon: Icon(Icons.more_vert))

                      ],
                    ),
                    contentPadding: EdgeInsets.zero,
                  );
                }),
              ),
            ],
          ).paddingSymmetric(horizontal: 15,vertical: 10),
        );
      }
    );
  }
}
