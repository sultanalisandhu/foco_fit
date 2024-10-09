import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/utils/local_storage.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class ChangeAppLanguage extends StatelessWidget {
  ChangeAppLanguage({super.key});
  final RxList appLanguages = [
    'English',
    'Portugese',
  ].obs;

  final RxInt selectedLanguage = (-1).obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar:kAppBar(
        title: AppStrings.switchLanguage,
        onTap: (){
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KText( text:
            AppStrings.switchLanguageToEnjoyTHeApp,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: mQ.height * 0.1),
              child: ListView.builder(
                itemCount: appLanguages.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(() {
                    return GestureDetector(
                      onTap: () {
                        selectedLanguage.value = index;
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
                        decoration: BoxDecoration(
                          color: AppColor.lightBlueColor,
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                            color:  selectedLanguage.value == index?AppColor.blackColor:AppColor.lightGreyColor,
                            width: 1.5,
                          ),
                        ),
                        child: KText(text:
                        appLanguages[index].toString(),
                            color: selectedLanguage.value == index?AppColor.blackColor:AppColor.blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    );
                  });
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            kTextButton(
              btnText: AppStrings.save,
              onPressed: () {
                if(selectedLanguage.value == 0){
                  Get.updateLocale(const Locale('en', 'US'));
                  LocalStorage.write(LocalStorage.languageName,'English');
                  LocalStorage.write(LocalStorage.languageCode,'en');
                  LocalStorage.write(LocalStorage.languageCountryCode,'US');
                  printWarning('English set as default Language');
                }else{
                  Get.updateLocale(const Locale('pt', 'PT'));
                  LocalStorage.write(LocalStorage.languageName,'Portugese');
                  LocalStorage.write(LocalStorage.languageCode,'pt');
                  LocalStorage.write(LocalStorage.languageCountryCode,'PT');
                  printWarning('Portugese set as default Language');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

