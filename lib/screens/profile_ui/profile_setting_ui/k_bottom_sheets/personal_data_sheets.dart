import 'package:flutter/material.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_height.dart';
import 'package:get/get.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

class KPersonalDataSheet {
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
      heightFactor: 0.25, onConfirmTap: () {  },
    );
  }
  static void editHeight(BuildContext context, {Function()? onConfirmTap}) {
    final c = Get.put(ProfileController());

    show(
      context: context,
      title: 'Altura',
      content: [
        /// select measurement container
        Obx(()=>Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeightContainer(text: 'cm',
                isSelected: c.selectedHeight.value == 'cm',
                onTap: () {
                  c.selectedHeight.value='cm';
                }),
            20.width,
            HeightContainer(text: 'ft/In',
                isSelected: c.selectedHeight.value == 'ft/In',
                onTap: () {
                  c.selectedHeight.value='ft/In';
                }),
          ],
        )),
        15.height,
        c.selectedHeight.value=='ft/In'
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: c.ftController,
                onSelectedItemChanged: (value) {
                  c.heightInFt.value = value;
                },
                itemExtent: 65,
                perspective: 0.006,
                diameterRatio: 1.9,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 21,
                  builder: (context, index) {
                    return Obx(()=> Center(
                      child: index == c.heightInFt.value
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
            20.width,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: c.inchController, // Use a different controller for the second ListWheelScrollView
                onSelectedItemChanged: (value) {
                  c.heightInch.value = value;
                },
                itemExtent: 65,
                perspective: 0.006,
                diameterRatio: 1.9,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 13,
                  builder: (context, index) {
                    return Obx(()=> Center(
                      child: index == c.heightInCm.value
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
                controller: c.cmController,
                onSelectedItemChanged: (value) {
                  c.heightInCm.value = value;
                },
                itemExtent: 65,
                perspective: 0.006,
                diameterRatio: 1.9,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 500,
                  builder: (context, index) {
                    return  Obx(()=>Center(child:
                    index == c.heightInCm.value
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
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.7,
    );
  }

  static void editDateBirth(BuildContext context, {Function()? onConfirmTap}) {
    final profileController = Get.put(ProfileController());

    show(
      context: context,
      title: 'Data de nascimento',
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Date ScrollView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: profileController.dateController,
                onSelectedItemChanged: (value) {
                  profileController.currentDate.value = value + 1;
                },
                itemExtent: 60,
                perspective: 0.009,
                diameterRatio: 2.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 31,
                  builder: (context, index) {
                    return Obx(() => Center(
                      child: index + 1 == profileController.currentDate.value
                          ? GradientText(
                        text: (index + 1).toString(),
                        gradient: AppColor.primaryGradient,
                        style: primaryTextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                          : Text(
                        (index + 1).toString(),
                        style: primaryTextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ));
                  },
                ),
              ),
            ),
            Text('/', style: primaryTextStyle(fontSize: 40)),
            // Month ScrollView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: profileController.monthController,
                onSelectedItemChanged: (value) {
                  profileController.currentMonth.value = value + 1;
                },
                itemExtent: 60,
                perspective: 0.009,
                diameterRatio: 2.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 12,
                  builder: (context, index) {
                    return Obx(() => Center(
                      child: index + 1 == profileController.currentMonth.value
                          ? GradientText(
                        text: (index + 1).toString(),
                        gradient: AppColor.primaryGradient,
                        style: primaryTextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                          : Text(
                        (index + 1).toString(),
                        style: primaryTextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ));
                  },
                ),
              ),
            ),
            Text('/', style: primaryTextStyle(fontSize: 40)),
            // Year ScrollView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: profileController.yearController,
                onSelectedItemChanged: (value) {
                  profileController.currentYear.value = 1990 + value;
                },
                itemExtent: 60,
                perspective: 0.009,
                diameterRatio: 2.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: profileController.currentYearValue - 1990 + 1,
                  builder: (context, index) {
                    return Obx(() => Center(
                      child: 1990 + index == profileController.currentYear.value
                          ? GradientText(
                        text: (1990 + index).toString(),
                        gradient: AppColor.primaryGradient,
                        style: primaryTextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                          : Text(
                        (1990 + index).toString(),
                        style: primaryTextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.4,
    );
  }

  static void editGender(BuildContext context, {Function()? onConfirmTap}) {
    final profileController = Get.put(ProfileController(),tag: 'profileDController');
      show(
        context: context,
        title: 'Gênero',
        content: [
          for (int i = 0; i < profileController.genderList.length; i++)
            Obx(() => Container(
              margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text(
                    profileController.genderList[i].toString(),
                    style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    profileController.selectedGenderIndex.value = i;
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: profileController.selectedGenderIndex.value == i
                          ? AppColor.startGradient
                          : AppColor.greyBorder,
                    ),
                  ),
                ),
              ),
            ),
        ],
        onConfirmTap: onConfirmTap,
        heightFactor: 0.45,
      );
    }

  static void editActivityLevel(BuildContext context, {Function()? onConfirmTap}) {
    final profileController = Get.put(ProfileController(),tag: 'profileDController');
    show(
      context: context,
      title: 'Nível de atividade',
      content: [
        for (int i = 0; i < profileController.activityLevelList.length; i++)
          Obx(() => Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(
                profileController.activityLevelList[i].title.toString(),
                style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                profileController.activityLevelList[i].subTitle.toString(),
                style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                profileController.selectedGenderIndex.value = i;
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: profileController.selectedGenderIndex.value == i
                      ? AppColor.startGradient
                      : AppColor.greyBorder,
                ),
              ),
            ),
          ),
          ),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.6,
    );
  }

  static void editCurrentWeight(BuildContext context, {Function()? onConfirmTap}) {
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

  static void editGoalWeight(BuildContext context, {Function()? onConfirmTap}) {
    final c = Get.put(ProfileController());
    show(
      context: context,
      title: 'Peso meta',
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
    return kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap!,
      btnText: 'Salvar',
      useGradient: true,
    );
  }
}
