import 'package:flutter/material.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_height.dart';
import 'package:focofit/screens/profile_ui/calender_ui.dart';
import 'package:get/get.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

class KProfileSheets {
  static void show({
    required BuildContext context,
    String? title,
    required List<Widget> content,
    Function()? onConfirmTap,
    double heightFactor = 0.4,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      isScrollControlled: true,
      isDismissible: false,
      barrierColor: Colors.grey.withOpacity(0.5),
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
                20.height,
                title!=null?_buildTitle(title):SizedBox.shrink(),
                const Divider(color: AppColor.lightGreyColor,),
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
  static void editHistoricoSheet(BuildContext context, {
    required Function() onConfirmTap,
    required Function() onCancelTap}) {
    show(
      context: context,
      title: 'Editar histórico',
      content: [
        Align(
            alignment: Alignment.center,
            child: Text('O que deseja fazer com este histórico?',
              textAlign: TextAlign.center,
              style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),)),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            KOutlineButton(
              onTap: onCancelTap,
              btnText: 'Excluir',
              gradient: AppColor.blackGradient,
              textGradient: AppColor.blackGradient,
              width:120,
            ),
            kTextButton(
              onPressed: onConfirmTap,
              btnText: 'Alterar',
              useGradient: true,
              width:120,
            ),
          ],
        ),
      ],
      heightFactor: 0.25,
    );
  }

  static void selectDateRange(BuildContext context, {required ProfileController controller}) {
    show(
      context: context,
      content: [
      CalenderUi(controller: controller,),
      ],
      heightFactor: 0.46,
    );
  }

  static void editWeightHistory(BuildContext context, {Function()? onConfirmTap}) {
    final c = Get.put(ProfileController());
    show(
      context: context,
      title: 'Peso atual',
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: c.kgController,
                onSelectedItemChanged: (value) {
                  c.selectedWeightKg.value = value;
                },
                itemExtent: 65,
                perspective: 0.006,
                diameterRatio: 1.9,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 120,
                  builder: (context, index) {
                    return Obx(()=> Center(
                      child: index == c.selectedWeightKg.value
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
            20.width,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: c.grController,
                onSelectedItemChanged: (value) {
                  c.selectedWeightGr.value = value;
                },
                itemExtent: 65,
                perspective: 0.006,
                diameterRatio: 1.9,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 1000,
                  builder: (context, index) {
                    return Obx(()=> Center(
                      child: index == c.selectedWeightGr.value
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
      ],
      onConfirmTap: onConfirmTap,
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
    return onConfirmTap!=null?kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap,
      btnText: 'Salvar',
      useGradient: true,
    ):const SizedBox.shrink();
  }
}
