import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class MedicalConditions extends StatelessWidget {
  MedicalConditions({super.key});

  final List<String> medicalConditions = [
    'Hipertensão',
    'Diabetes ou resistência a insulina',
    'Asma',
    'Colesterol alto',
    'Arritmia',
    'Doenças de tireóide',
    'Não tenho nenhuma'
  ];

  // List to track the selected state of each condition
  final RxList<bool> selectedConditions = List<bool>.filled(7, false).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: 'Condições médicas',
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: kTextButton(
          onPressed: () {
            // Add your logic to handle saving the selected conditions here
            List<String> selectedMedicalConditions = [];
            for (int i = 0; i < medicalConditions.length; i++) {
              if (selectedConditions[i]) {
                selectedMedicalConditions.add(medicalConditions[i]);
              }
            }
            // Print the selected conditions
            print("Selected Conditions: $selectedMedicalConditions");
          },
          btnText: 'Salvar',
          useGradient: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            ListView.builder(
              itemCount: medicalConditions.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Obx(
                      () => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      onTap: () {
                        // Toggle the selection state of the item
                        selectedConditions[index] = !selectedConditions[index];
                      },
                      contentPadding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selectedConditions[index]
                              ? AppColor.startGradient
                              : AppColor.greyColor,
                          width: selectedConditions[index] ? 2 : 1,
                        ),
                      ),
                      titleTextStyle: primaryTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColor.blackColor,
                      ),
                      title: Text(medicalConditions[index]),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
