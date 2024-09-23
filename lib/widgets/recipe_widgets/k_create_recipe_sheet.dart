import 'package:flutter/material.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:get/get.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

class KCreateRecipeSheetSheet {
  static void show({
    required BuildContext context,
    required String title,
    required List<Widget> content,
    required Function()? onConfirmTap,
    double heightFactor = 0.4,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: AppColor.whiteColor,
      builder: (BuildContext context) {
        return SizedBox(
          height: context.isKeyboardVisible ? mQ.height : mQ.height * heightFactor,
          width: mQ.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.isKeyboardVisible ? 30.height : 2.height,
                _buildHeader(),
                const Divider(color: AppColor.lightGreyColor,),
                20.height,
                _buildTitle(title),
                10.height,
                ...content,
                const Spacer(),
                _buildConfirmButton(onConfirmTap),
              ],
            ),
          ),
        );
      },
    );
  }

  static void addQuantityType(BuildContext context, {Function()? onConfirmTap, required RecipeController c}) {
    RxInt tempSelectedIndex = 0.obs;
    context.dismissKeyBoard();
    show(
      context: context,
      title: 'Selecione a medida',
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.75,
              child: ListWheelScrollView.useDelegate(
                controller: c.quantityController,
                onSelectedItemChanged: (value) {
                  tempSelectedIndex.value = value;
                },
                itemExtent: 65,
                perspective: 0.006,
                diameterRatio: 1.6,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: c.quantityTypeList.length,
                  builder: (context, index) {
                    return Obx(()=>Center(
                        child: index == tempSelectedIndex.value
                            ? GradientText(
                          text: c.quantityTypeList[index],
                          gradient: AppColor.primaryGradient,
                          style: primaryTextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                            : Text(
                          c.quantityTypeList[index],
                          style: primaryTextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
      onConfirmTap: () {
        FocusScope.of(context).unfocus();
        c.selectedQuantityType.value = c.quantityTypeList[tempSelectedIndex.value];
        print('Selected Quantity Type: ${c.selectedQuantityType.value}');

        Navigator.pop(context);
        if (onConfirmTap != null) {
          onConfirmTap();
        }
      },
      heightFactor: 0.45,
    );
  }



  static Widget _buildHeader() {
    return Align(
      alignment: Alignment.center,
      child: showSvgIconWidget(iconPath: AppIcons.dashIcon),
    );
  }

  static Widget _buildTitle(String title) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: primaryTextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget _buildConfirmButton(Function()? onConfirmTap) {
    return kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap!,
      btnText: 'Salvar',
      useGradient: true,
    );
  }
}
